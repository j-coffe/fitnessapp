
import fitnessapp.Competition
import fitnessapp.Users

class BootStrap {

    def init = { servletContext ->
        //Competition c=new Competition(title:"Yarik",date:new Date(),categories:new CompCategory(title:"40 man")).save();
        Users u = Users.findByLogin("admin");
        if(u==null){
            new Users(login:"admin",password:"admin").save();
        }
    }
    def destroy = {
    }
}
