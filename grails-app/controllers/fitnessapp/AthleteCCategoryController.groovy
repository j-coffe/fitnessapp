package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AthleteCCategoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //respond AthleteCCategory.list(params), model:[athleteCCategoryInstanceCount: AthleteCCategory.count()]
        Athlete a = Athlete.findById(session["athlete"].id)
        println a.athleteccategory
        respond a.athleteccategory, model:[athleteCCategoryCount: a.athleteccategory.size(),
        athleteCCategoryInstanceList:a.athleteccategory.sort({it.ccategory.title})]
    }

    def show(AthleteCCategory athleteCCategoryInstance) {
        respond athleteCCategoryInstance
    }

    def create() {
        respond new AthleteCCategory(params)
    }

    @Transactional
    def save(AthleteCCategory athleteCCategoryInstance) {
                
        if (athleteCCategoryInstance == null) {
            notFound()
            return
        }
        
        //добавляем атлету категории
        def list=[];
        list<<params.ccategory.id;
        list=list.flatten();
        list.each({
                AthleteCCategory ac=new AthleteCCategory();
                ac.athlete=session["athlete"]
                ac.ccategory=CCategory.get(it)
                println ac.validate();
                ac.save() //flush:true
            })
        //добавить нулевые оценки в протоколы
        list.each({
                def ccat = CCategory.findById(it)
                def prot =ccat.protocols
                prot.each({
                        AthletePoint ap=new AthletePoint(point1:0,point2:0,athlete:session["athlete"],protocol:it);
                        println ap.validate();
                        ap.save();
                })
                //println prot;
            })
        
        //--
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'athleteCCategoryInstance.label', default: 'AthleteCCategory'), athleteCCategoryInstance.id])
                redirect( action: "index") //athleteCCategoryInstance
            }
            '*' { respond athleteCCategoryInstance, [status: CREATED] }
        }
    }

    def edit(AthleteCCategory athleteCCategoryInstance) {
        respond athleteCCategoryInstance
    }

    @Transactional
    def update(AthleteCCategory athleteCCategoryInstance) {
        if (athleteCCategoryInstance == null) {
            notFound()
            return
        }

        if (athleteCCategoryInstance.hasErrors()) {
            respond athleteCCategoryInstance.errors, view:'edit'
            return
        }

        athleteCCategoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AthleteCCategory.label', default: 'AthleteCCategory'), athleteCCategoryInstance.id])
                redirect athleteCCategoryInstance
            }
            '*'{ respond athleteCCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AthleteCCategory athleteCCategoryInstance) {

        if (athleteCCategoryInstance == null) {
            notFound()
            return
        }

        athleteCCategoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AthleteCCategory.label', default: 'AthleteCCategory'), athleteCCategoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'athleteCCategoryInstance.label', default: 'AthleteCCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
