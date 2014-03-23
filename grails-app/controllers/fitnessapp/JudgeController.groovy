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
        respond judgeInstance
    }

    def create() {
        respond new Judge(params)
    }

    @Transactional
    def save(Judge judgeInstance) {
        if (judgeInstance == null) {
            notFound()
            return
        }
        
        judgeInstance.competition=session["competition"]
        println judgeInstance.validate();

        if (judgeInstance.hasErrors()) {
            respond judgeInstance.errors, view:'create'
            return
        }

        judgeInstance.save flush:true

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
