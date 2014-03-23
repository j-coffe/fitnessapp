package fitnessapp

class AthleteCCategory {

    Athlete athlete;
    CCategory ccategory;
    static constraints={
        athlete unique: ['ccategory']
        
    }
    
    //static belongsTo =[ccategory:CCategory, athlete:Athlete];
}
