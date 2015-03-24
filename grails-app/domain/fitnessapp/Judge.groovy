package fitnessapp

class Judge {
    String firstName;//,secondName,middleName;
    Integer num;
    
    static belongsTo =[competition:Competition];
    static hasMany = [protocols : Protocol];
}
