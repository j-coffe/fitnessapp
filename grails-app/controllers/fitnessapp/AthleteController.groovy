package fitnessapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AthleteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //Competition c=session["competition"];
        
        //respond Athlete.findByCompetitions(c), model:[athleteInstanceCount: Athlete.countByCompetitions(c)]
        respond Athlete.list(params), model:[athleteInstanceCount: Athlete.count()]
    }

    def show(Athlete athleteInstance) {
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
        
        if (athleteInstance.hasErrors()) {
            respond athleteInstance.errors, view:'create'
            return
        }
        athleteInstance.competition=session["competition"]
        athleteInstance.save flush:true
        //Competition c=session["competition"];
        //c.addToAthletes(athleteInstance);
       // c.save flush:true
        
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
       
        if (athleteInstance.hasErrors()) {
            respond athleteInstance.errors, view:'edit'
            return
        }

        athleteInstance.save flush:true

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

        athleteInstance.delete flush:true

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
