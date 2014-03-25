package fitnessapp

import grails.converters.JSON
import grails.web.RequestParameter

class ProtocolController {
    
    static allowedMethods = [getAthletesByCatId: "GET"]
    
    def showIndex() { 
        //Competition comp =  session["competition"];
        // <!--   <g:select name="ccategory.title" from="${categs}"/>-->
        // Set categs = comp.ccategories;
//        fitnessapp.CCategory ca = session["categ"];
//        println(ca.title);
        render(view: "index")
    }
    
    def getAthletesByCatId(@RequestParameter('id') int id) {
      //  Integer id = params.id;
        Competition comp =  session["competition"];
        CCategory cat = CCategory.findById(id);
        //println(cat.title);
        def athletes = AthleteCCategory.findAllByCcategory(cat);
         def list = [];
        for(i in athletes) {
            Athlete ath = i.athlete;
             def athMap=[secondName: ath.secondName, firstName: ath.firstName];
             list.add(athMap);
        }
        render list as JSON;
    }
    
    
}
