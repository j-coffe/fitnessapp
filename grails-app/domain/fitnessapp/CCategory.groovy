package fitnessapp

class CCategory {
    String title;
    
    Competition competition;
    static belongsTo =[competition : Competition];   
    static hasMany=[athleteccategory:AthleteCCategory, protocols : Protocol]
}
