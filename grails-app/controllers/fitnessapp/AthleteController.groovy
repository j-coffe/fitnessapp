package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AthleteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //params.competition=[competition:session["competition"]]
        //Competition c=session["competition"];
        
        //respond Athlete.findAll({competition==session["competition"]}), model:[athleteInstanceCount: Athlete.findAll({competition==session["competition"]}).size()]
        respond Athlete.list(params).findAll({it.competition.id==session["competition"].id}), model:[athleteInstanceCount: Athlete.list(params).findAll({it.competition.id==session["competition"].id}).size()]
        //respond Athlete.findAllWhere(params), model:[athleteInstanceCount: Athlete.count()]
    }

    def show(Athlete athleteInstance) {
        session["athlete"]=athleteInstance
        respond athleteInstance
    }

    def create() {
        respond new Athlete(params)
    }

    @Transactional
    def save(Athlete athleteInstance) {
        
        if (athleteInstance == null) {
            notFound()
            return
        }
        athleteInstance.competition=session["competition"]
        println athleteInstance.validate()
        if (athleteInstance.hasErrors()) {
            respond athleteInstance.errors, view:'create'
            return
        }
        
        athleteInstance.save flush:true
        
        
        //добавляем атлету категории
        def list=[];
        list<<params.ccategory.id;
        list=list.flatten();
        list.each({
                AthleteCCategory ac=new AthleteCCategory();
                ac.athlete=athleteInstance
                ac.ccategory=CCategory.get(it)
                println ac.validate();
                ac.save(flush: true) //flush:true
            })
        //добавить нулевые оценки в протоколы
        list.each({
                def ccat = CCategory.findById(it)
                def prot =ccat.protocols
                prot.each({
                        AthletePoint ap=new AthletePoint(point1:0,point2:0,athlete:athleteInstance,protocol:it);
                        println ap.validate();
                        ap.save(flush: true);
                    })
                //println prot;
            })
        //--
        
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'athleteInstance.label', default: 'Athlete'), athleteInstance.id])
                redirect athleteInstance
            }
            '*' { respond athleteInstance, [status: CREATED] }
        }
    }

    def edit(Athlete athleteInstance) {
        respond athleteInstance
    }

    @Transactional
    def update(Athlete athleteInstance) {
        if (athleteInstance == null) {
            notFound()
            return
        }
        athleteInstance.competition=session["competition"]
        println athleteInstance.validate()
        if (athleteInstance.hasErrors()) {
            respond athleteInstance.errors, view:'edit'
            return
        }
           
        athleteInstance.save(flush: true)
        
        def remac = AthleteCCategory.findAllByAthlete(athleteInstance);
        println AthleteCCategory.findAllByAthlete(athleteInstance).size()
        remac.collect({it.delete(flush: true)})
        //println AthleteCCategory.findAllByAthlete(athleteInstance).size()
        
        def remap = AthletePoint.findAllByAthlete(athleteInstance);
        println AthletePoint.findAllByAthlete(athleteInstance).size()
        remap.collect({it.delete(flush: true)})
        //println AthletePoint.findAllByAthlete(athleteInstance).size()
        
        def list=[];
        list<<params.ccategory.id;
        list=list.flatten();
        list.each({
                AthleteCCategory ac=new AthleteCCategory();
                ac.athlete=athleteInstance
                ac.ccategory=CCategory.findById(it)
                println ac.validate();
                ac.save(flush: true) //flush:true
                println ac
            })
        list.each({
                def ccat = CCategory.findById(it)
                def prot =ccat.protocols
                prot.each({
                        AthletePoint ap=new AthletePoint(point1:0,point2:0,athlete:athleteInstance,protocol:it);
                        println ap.validate();
                        ap.save(flush: true);
                    })
                //println prot;
            })

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Athlete.label', default: 'Athlete'), athleteInstance.id])
                redirect athleteInstance
            }
            '*'{ respond athleteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Athlete athleteInstance) {

        if (athleteInstance == null) {
            notFound()
            return
        }

        def rem = AthleteCCategory.findAllByAthlete(athleteInstance);
        rem.collect({it.delete()})
        athleteInstance.delete()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Athlete.label', default: 'Athlete'), athleteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'athleteInstance.label', default: 'Athlete'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
