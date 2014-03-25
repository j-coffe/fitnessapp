package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CCategoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CCategory.list(params).findAll({it.competition.id==session["competition"].id}), model:[CCategoryInstanceCount: CCategory.list(params).findAll({it.competition.id==session["competition"].id}).size()]
        //respond CCategory.list(params), model:[CCategoryInstanceCount: CCategory.count()]
    }

    def show(CCategory CCategoryInstance) {
        session["ccategory"]=CCategoryInstance;
        respond CCategoryInstance
    }
    
    @Transactional
    def createProtocol(){
        def competition=Competition.findById(session['competition'].id);
        def ccategory= CCategory.findById(session["ccategory"].id);
        def judges = competition.judges;
        def athletes = ccategory.athleteccategory.athlete.sort({it.num});
        
        judges.each({ j ->
                //println j
                Protocol p=new Protocol(judge:j, ccategory:ccategory,competition:competition);
                athletes.each({ a ->
                        p.addToAthletePoints(new AthletePoint(athlete:a,point1:0,point2:0) );
                    })
                def q=p.save()
                if(q==null)println "Протокол не создался"
            })
        def protocols=Protocol.findAllByCcategory(ccategory);
        println protocols
        render (view:"createProtocol",model:[
                competition: competition,
                ccategory:ccategory,
                judges:judges,
                athletes:athletes,
                protocols:protocols
        ]);
    }

    def create() {
        respond new CCategory(params)
    }

    @Transactional
    def save(CCategory CCategoryInstance) {
        if (CCategoryInstance == null) {
            notFound()
            return
        }
        
        CCategoryInstance.competition=session["competition"]
        println CCategoryInstance.validate();
        if (CCategoryInstance.hasErrors()) {
            respond CCategoryInstance.errors, view:'create'
            return
        }

        CCategoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'CCategoryInstance.label', default: 'CCategory'), CCategoryInstance.id])
                redirect CCategoryInstance
            }
            '*' { respond CCategoryInstance, [status: CREATED] }
        }
    }

    def edit(CCategory CCategoryInstance) {
        respond CCategoryInstance
    }

    @Transactional
    def update(CCategory CCategoryInstance) {
        if (CCategoryInstance == null) {
            notFound()
            return
        }

        if (CCategoryInstance.hasErrors()) {
            respond CCategoryInstance.errors, view:'edit'
            return
        }

        CCategoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CCategory.label', default: 'CCategory'), CCategoryInstance.id])
                redirect CCategoryInstance
            }
            '*'{ respond CCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CCategory CCategoryInstance) {

        if (CCategoryInstance == null) {
            notFound()
            return
        }

        CCategoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CCategory.label', default: 'CCategory'), CCategoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'CCategoryInstance.label', default: 'CCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
