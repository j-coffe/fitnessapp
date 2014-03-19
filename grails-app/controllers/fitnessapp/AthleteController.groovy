package fitnessapp

class AthleteController {
//можно охранить жсп, которые он сгенерит и потом их редактировать
  //  def scaffold = Athlete
  def index() {
      
  }
  
    def create() {
        render(view : "create")
    }
    
    def show() {
         render(view : "show")       
    }
    
    def edit() {
        render(view : "edit")
    }
}
