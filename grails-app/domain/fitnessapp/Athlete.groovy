package fitnessapp

class Athlete {
    String firstName,secondName,middleName;
    Date birthday;
    Boolean sex;
    String city;
    Double height, weight;
    static constraints = {
//        height scale: 2
//        weight scale: 2
    }
    static belongsTo=Competition;
}
