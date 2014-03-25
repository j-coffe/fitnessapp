package fitnessapp

import grails.converters.JSON

class ProtocolController {
    
    def showIndex() { 
        //Competition comp =  session["competition"];
        // <!--   <g:select name="ccategory.title" from="${categs}"/>-->
        // Set categs = comp.ccategories;
        def categoryes = Competition.findById(session["competition"].id).ccategories;
        categoryes.collect({println(it.title)});
        render categoryes as JSON;
    }
    
    
}
