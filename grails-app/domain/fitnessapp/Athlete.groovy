package fitnessapp

class Athlete {

    Integer num;
    String firstName, secondName,middleName;
    Boolean sex;
    Date birthday;
    Double height,weight;
    static belongsTo=[competition:Competition];
}
