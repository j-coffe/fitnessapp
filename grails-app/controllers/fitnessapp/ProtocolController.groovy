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
        
        def athletes = AthleteCCategory.findAllByCcategory(cat);
        def protocols = Protocol.findAllByCcategoryAndCompetition(cat, comp);
        
        
        def totalList = [];
        for(q in athletes) {
          // q.athlete.id  - текущий атлет
          // id - текущая категория
          def athMap = [:];
          athMap=[athleteFIO : q.athlete.firstName + " " + q.athlete.secondName + " " + q.athlete.middleName];//наименование участника
          def q1 = AthletePoint.where{athlete == q.athlete && (protocol in protocols)};
          def q1Max = q1.where{point1 == max(point1)};
          def q1Min = q1.where{point1 == min(point1)};
          def q2Max = q1.where{point2 == max(point2)};
          def q2Min = q1.where{point2 == min(point2)};
          //бежим по протоколам каждого судьи (в данной категории)          
          for(n in protocols) {
              // n.id - текущий протокол
              def query = AthletePoint.where {  athlete == q.athlete && protocol == n}                
              AthletePoint ap = query.find();//оценки данного атлета
              int p1 = athMap?.point1 == null ? 0 : athMap?.point1;
              int p2 = athMap?.point2 == null ? 0 : athMap?.point2;
              if(ap != null) {
               athMap.put("point1", p1+ap.point1);
               athMap.put("point2", p2+ap.point2);
              } else {
               athMap.put("point1", p1);
               athMap.put("point2", p2);
              }
          }
          int p1 = athMap?.point1 == null ? 0 : athMap?.point1;
          int p2 = athMap?.point2 == null ? 0 : athMap?.point2;
          athMap.put("point1", p1-q1Max.findAll()[0].point1-q1Min.findAll()[0].point1);
          athMap.put("point2", p2-q2Max.findAll()[0].point2-q2Min.findAll()[0].point2);
          
          totalList.add(athMap);
        }
        
        
        //println(protocols.collect());
//         def list = [];
//        for(i in athletes) {
//            Athlete ath = i.athlete;
//             def athMap=[secondName: ath.secondName, firstName: ath.firstName];
//             list.add(athMap);
//        }
        
        
        render totalList as JSON;
    }
    
    
}
