package fitnessapp

class Athlete {
    Integer num;
    String firstName, secondName,middleName;
    Boolean sex;
    Date birthday;
    Double height,weight;
    String city;
    String  coachName;
    static constraints={
        num unique: ['competition']
        height nullable: true
        weight nullable: true
    }
    Integer round1sum=0;
    Integer round2sum=0;
    static transients =['round1sum','round2sum']
    
    static belongsTo =[competition:Competition];
    static hasMany=[athleteccategory:AthleteCCategory, athletePoints : AthletePoint]
}
