package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JudgeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //respond Judge.list(params), model:[judgeInstanceCount: Judge.count()]
        respond Judge.list(params).findAll({it.competition.id==session["competition"].id}), model:[judgeInstanceCount: Judge.list(params).findAll({it.competition.id==session["competition"].id}).size()]
    }

    def show(Judge judgeInstance) {
        session["judge"]=judgeInstance;
        respond judgeInstance
    }
    

    def create() {

        def query = Judge.where{num == max(num)}
        def result =  query?.get()
        if(result != null)
            params.maxnum = result.num+1
        else
            params.maxnum = 1
   
        
        respond new Judge(params)
    }

    @Transactional
    def save(Judge judgeInstance) {
        if (judgeInstance == null) {
            notFound()
            return
        }
        
        def competition=Competition.findById(session['competition'].id);
        judgeInstance.competition=competition;
        println judgeInstance.validate();

        if (judgeInstance.hasErrors()) {
            respond judgeInstance.errors, view:'create'
            return
        }

        judgeInstance.save flush:true
        //теперь добавляем протоколы ко всем соревнованиям
        competition.ccategories.sort({it.title}).each({
                Protocol p=new Protocol(judge:judgeInstance, ccategory:it,competition:competition);
                def result=p.save();
                if(result==null){
                    println "ERROR"
                }
            })
        //--
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'judgeInstance.label', default: 'Judge'), judgeInstance.id])
                redirect judgeInstance
            }
            '*' { respond judgeInstance, [status: CREATED] }
        }
    }

    def edit(Judge judgeInstance) {
        respond judgeInstance
    }
    
  

    @Transactional
    def update(Judge judgeInstance) {
        if (judgeInstance == null) {
            notFound()
            return
        }

        if (judgeInstance.hasErrors()) {
            respond judgeInstance.errors, view:'edit'
            return
        }

        judgeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Judge.label', default: 'Judge'), judgeInstance.id])
                redirect judgeInstance
            }
            '*'{ respond judgeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Judge judgeInstance) {

        if (judgeInstance == null) {
            notFound()
            return
        }

        judgeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Judge.label', default: 'Judge'), judgeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'judgeInstance.label', default: 'Judge'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
