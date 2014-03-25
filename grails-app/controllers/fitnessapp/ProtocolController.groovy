package fitnessapp

import grails.converters.JSON

class ProtocolController {
    
    def showIndex() { 
        Competition comp =  session["competition"];
        // <!--   <g:select name="ccategory.title" from="${categs}"/>-->
        // Set categs = comp.ccategories;
        fitnessapp.CCategory ca = session["categ"];
        println(ca.title);
        render(view: "index")
    }
    
    
}
