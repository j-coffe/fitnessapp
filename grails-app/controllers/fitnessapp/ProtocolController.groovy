package fitnessapp

import grails.converters.JSON
import grails.transaction.Transactional
import grails.web.RequestParameter

class ProtocolController {
    
    static allowedMethods = [getAthletesByCatId: "GET",edit:"GET",saveAll:"POST"]
    
    
    def showIndex() { 
        render(view: "index")
    }
    
    def getAthletesByCatId(@RequestParameter('id') int id) {
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
    
    
    @Transactional
    def edit() {
        Competition competition =  Competition.findById(session["competition"].id);
        CCategory ccategory=CCategory.findById(params['category_id']);
        def judges = competition.judges;
        def protocols=judges.protocols;
        
        render (view:"edit",model:[ccategory:ccategory,judges:judges,protocols:protocols,competition:competition])
    }  
    
    @Transactional
    def saveAll() {
        println params
        params.each({ t,v ->
                if(t.split("_")[0]=="pp1"){
                    AthletePoint ap=AthletePoint.findById(t.split("_")[1]);
                    ap.point1=v.toInteger();
                    ap.save()
                     println (ap.id +" "+ ap.point1+" "+t+" "+v)
                }
                else if(t.split("_")[0]=="pp2"){
                    AthletePoint ap=AthletePoint.findById(t.split("_")[1]);
                    ap.point2=v.toInteger();
                    ap.save()
                    println (ap.id +" "+ ap.point2+" "+t+" "+v)
                }
        })
        
        render (view:"index")
    }
    
}
