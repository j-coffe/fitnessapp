package fitnessapp

class Protocol {
        
    static belongsTo = [judge : Judge, ccategory : CCategory, competition : Competition];
    static hasMany = [athletePoints : AthletePoint];
    static constraints = {
    }
}
