package fitnessapp

class CCategory {
    String title;
    
    Competition competition;
    static belongsTo =[Competition];   
    static hasMany=[athleteccategory:AthleteCCategory]
}
