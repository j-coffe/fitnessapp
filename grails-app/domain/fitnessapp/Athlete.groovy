package fitnessapp

class Athlete {

    String firstName, secondName,middleName;
    Boolean sex;
    Date birthday;
    Double height,weight;
    static belongsTo=[competition:Competition];
}
