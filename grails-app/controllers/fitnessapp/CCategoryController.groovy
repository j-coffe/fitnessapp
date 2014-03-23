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
        respond CCategoryInstance
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
