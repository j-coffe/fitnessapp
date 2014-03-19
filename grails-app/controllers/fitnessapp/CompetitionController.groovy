package fitnessapp

class CompetitionController {

    def index() {
        render(view: 'competitionIndex');
    }
    
    def list() {
        
    }
    
    def add() {
        //надо делать проще через Data Binding. как и для отображения нужно возвращать мапу с моделью
        //а рендерить ее в жсп уже
        println(params.firstName)
        def ath = new Athlete(firstName: params.firstName,secondName: "",middleName: "",
            birthday : new Date(), sex: true, city :"",
            height : 1.2, weight: 1.5);
        ath.save()//не сохраняет почему-то
        redirect(controller: 'athlete')
    }
}
