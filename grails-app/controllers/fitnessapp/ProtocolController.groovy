package fitnessapp

import grails.converters.JSON
import grails.transaction.Transactional
import grails.web.RequestParameter

class ProtocolController {
    
    static allowedMethods = [getAthletesByCatId: "GET",edit:"GET"]
    
    
    def showIndex() { 
        render(view: "index")
    }
    
    def getAthletesByCatId(@RequestParameter('id') int id) {
        Competition comp =  session["competition"];
        CCategory cat = CCategory.findById(id);
        def athletes = AthleteCCategory.findAllByCcategory(cat);
         def list = [];
        for(i in athletes) {
            Athlete ath = i.athlete;
             def athMap=[secondName: ath.secondName, firstName: ath.firstName];
             list.add(athMap);
        }
        render list as JSON;
    }
    
    
    @Transactional
    def edit() {
        Competition competition =  Competition.findById(session["competition"].id);
        CCategory ccategory=CCategory.findById(params['category_id']);
        def judges = competition.judges;
        def protocols=judges.protocols;
        
        render (view:"edit",model:[ccategory:ccategory,judges:judges,protocols:protocols,competition:competition])
    }  
}
