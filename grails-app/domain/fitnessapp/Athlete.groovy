package fitnessapp

class Athlete {

    String firstName, secondName,middleName;
    Boolean sex;
    Date birthday;
    Double height,weight;
    static belongsTo=Competition;
    static constraints = {
        
        firstName (blank: false);
        middleName(blank: false);
        secondName(blank: false);
        birthday(blank: false);
        sex(blank: false);
        height(blank: false);
        weight(blank: false);
        belongsTo(display:false);
    }
}
