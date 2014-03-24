package fitnessapp

class ProtocolController {
    
    def showIndex() { 
        Competition comp =  session["competition"];
        // <!--   <g:select name="ccategory.title" from="${categs}"/>-->
       // Set categs = comp.ccategories;
        
        render(view: "index")
    }
}
