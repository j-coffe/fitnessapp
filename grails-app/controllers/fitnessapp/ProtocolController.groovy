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
            athMap=[athleteFIO : q.athlete.firstName + " " + q.athlete.secondName + " " + q.athlete.middleName, athleteNum : q.athlete.num];//наименование участника
            def q1 = AthletePoint.where{athlete == q.athlete && (protocol in protocols)};
            int max1 = q1.list().point1.max();
            int min1 = q1.list().point1.min();
            int max2 = q1.list().point2.max();
            int min2 = q1.list().point2.min();

            //def q1Max = q1.where{point1 == max(point1)};
          
            //def q1Min = q1.where{point1 == min(point1)};
          
            // def q2Max = q1.where{point2 == max(point2)};
            // def q2Min = q1.where{point2 == min(point2)};
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
            athMap.put("point1", p1-max1-min1);
            athMap.put("point2", p2-max2-min2);
          
            if(cat.summarize){
                if(athMap.point2==0){
                    athMap.put("summ",athMap.point1+athMap.point2+10_000 );
                }
                else{
                    athMap.put("summ", athMap.point1+athMap.point2);
                }
            }
            else{
                if(athMap.point2==0){
                    athMap.put("point2",athMap.point2+10_000 );
                }
            }
        
            totalList.add(athMap);
        }
        if(cat.summarize){
            totalList.sort({a,b -> a.summ <=> b.summ})
            for(t in totalList){
                if((t.summ)>=10_000)
                t.summ-=10000;
                println t.summ
            }
        }
        else{
            totalList.sort({a,b -> a.point2 <=> b.point2?:a.point1 <=> b.point1})
             for(t in totalList){
                if((t.point2)>=10_000)
                t.point2-=10000;
                println t.point2
            }
        }
    
        
        //Если хотим ограничить параметром из категории
        def numForPass = cat.numForPass;
        //обрезать totalList 
        
        
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
    def edit(@RequestParameter('round') int round) {
        Competition competition =  Competition.findById(session["competition"].id);
        CCategory ccategory=CCategory.findById(params['category_id']);
        def judges = competition.judges;
        def protocols=judges.protocols;
        flash.categ = params['category_id'];
        // все атлеты в категории
        def athletes = AthleteCCategory.findAllByCcategory(ccategory);
        def prot = Protocol.findAllByCcategoryAndCompetition(ccategory, competition);
        for(q in athletes) {
            // q.athlete.id  - текущий атлет
            // id - текущая категория
            def q1 = AthletePoint.where{athlete == q.athlete && (protocol in prot)};
            q.athlete.round1sum=q1.list().point1.sum() - q1.list().point1.max() - q1.list().point1.min()
            
        }
        def myShortListOfAthletes = athletes.athlete.sort({it.round1sum}).take(ccategory.numForPass)
        //        println athletes.athlete.sort({it.round1sum}).take(ccategory.numForPass);
        //
        render (view:"edit",model:[ccategory:ccategory,judges:judges,protocols:protocols,competition:competition,round:round,myshortlistofathletes:myShortListOfAthletes])
    }  
    
    @Transactional
    def saveAll() {
        params.each({ t,v ->
                if(t.split("_")[0]=="pp1"){
                    AthletePoint ap=AthletePoint.findById(t.split("_")[1]);
                    ap.point1=v.toInteger();
                    ap.save(flush: true)
                    //println (ap.id +" "+ ap.point1+" "+t+" "+v)
                }
                else if(t.split("_")[0]=="pp2"){
                    AthletePoint ap=AthletePoint.findById(t.split("_")[1]);
                    ap.point2=v.toInteger();
                    ap.save(flush: true)
                    //println (ap.id +" "+ ap.point2+" "+t+" "+v)
                }
            })
        //        params.category_id=ccategory.id;
        //println flash.categ  //${flash.categ}
        render (view:"index")
    }
    
}
