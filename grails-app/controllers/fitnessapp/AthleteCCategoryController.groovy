package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AthleteCCategoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //respond AthleteCCategory.list(params), model:[athleteCCategoryInstanceCount: AthleteCCategory.count()]
        respond AthleteCCategory.list(params).findAll({it.athlete.id==session["athlete"].id}), model:[athleteCCategoryCount: AthleteCCategory.list(params).findAll({it.athlete.id==session["athlete"].id}).size()]
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
        athleteCCategoryInstance.athlete=session["athlete"]
        println athleteCCategoryInstance.validate();
        if (athleteCCategoryInstance.hasErrors()) {
            respond athleteCCategoryInstance.errors, view:'create'
            return
        }

        athleteCCategoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'athleteCCategoryInstance.label', default: 'AthleteCCategory'), athleteCCategoryInstance.id])
                redirect athleteCCategoryInstance
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
