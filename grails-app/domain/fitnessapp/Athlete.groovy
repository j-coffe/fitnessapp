package fitnessapp

class Athlete {
    Integer num;
    String firstName, secondName,middleName;
    Boolean sex;
    Date birthday;
    Double height,weight;
    String city;
    static constraints={
        num unique: ['competition']
        
    }
    
    
    static belongsTo =[competition:Competition];
    static hasMany=[athleteccategory:AthleteCCategory, athletePoints : AthletePoint]
}
