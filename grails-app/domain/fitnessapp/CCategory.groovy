package fitnessapp

class CCategory {
    String title;
    Integer numForPass;
    Boolean summarize;
    
    Competition competition;
    static belongsTo =[competition : Competition];   
    static hasMany=[athleteccategory:AthleteCCategory, protocols : Protocol]
}
