package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CompetitionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Competition.list(params), model:[competitionInstanceCount: Competition.count()]
    }

    def show(Competition competitionInstance) {
        respond competitionInstance
    }

    def create() {
        respond new Competition(params)
    }

    @Transactional
    def save(Competition competitionInstance) {
        if (competitionInstance == null) {
            notFound()
            return
        }

        if (competitionInstance.hasErrors()) {
            respond competitionInstance.errors, view:'create'
            return
        }

        competitionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'competitionInstance.label', default: 'Competition'), competitionInstance.id])
                redirect competitionInstance
            }
            '*' { respond competitionInstance, [status: CREATED] }
        }
    }

    def edit(Competition competitionInstance) {
        respond competitionInstance
    }

    @Transactional
    def update(Competition competitionInstance) {
        if (competitionInstance == null) {
            notFound()
            return
        }

        if (competitionInstance.hasErrors()) {
            respond competitionInstance.errors, view:'edit'
            return
        }

        competitionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Competition.label', default: 'Competition'), competitionInstance.id])
                redirect competitionInstance
            }
            '*'{ respond competitionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Competition competitionInstance) {

        if (competitionInstance == null) {
            notFound()
            return
        }

        competitionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Competition.label', default: 'Competition'), competitionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'competitionInstance.label', default: 'Competition'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
