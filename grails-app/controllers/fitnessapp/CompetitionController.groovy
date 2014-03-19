package fitnessapp

class CompetitionController {

    def index() {
        render "index";
    }
    
    def listOfCompetition(){
        
        render (view : "listOfCompetition", model: [competitions:Competition.findAll()]);
    }
}
