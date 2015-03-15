package fitnessapp

class UsersController {
    
    static allowedMethods = [getAthletesByCatId: "GET",edit:"GET",saveAll:"POST"]

    def index() { }
    
    def login(){
        println "q 1";
        if (request.get) {
            println "q 2";
            //return // render the login view
            render(view: "login", model: [message: "!"])
        }
        def u = Users.findByLogin(params.login)
        println "q 3";
        if (u) {
            println "q 4";
            if (u.password == params.password) {
                println "q 5";
                session.user = u
                redirect(controller:"competition",action:"index")
            }
            else {
                println "q 6";
                render(view: "login", model: [message: "Password incorrect"])
            }
        }
        else {
            println "q 7";
            render(view: "login", model: [message: "User not found"])
        }
    }
}
