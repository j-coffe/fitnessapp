package fitnessapp

class Athlete {
    Integer num;
    String firstName, secondName,middleName;
    Boolean sex;
    Date birthday;
    Double height,weight;
    String city;
    
    static belongsTo =[competition:Competition];
    static hasMany=[athleteccategory:AthleteCCategory]
}
