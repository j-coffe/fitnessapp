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
    Integer round1sum=0;
    Integer round2sum=0;
    static transients =['round1sum','round2sum']
    
    static belongsTo =[competition:Competition];
    static hasMany=[athleteccategory:AthleteCCategory, athletePoints : AthletePoint]
}
