package fitnessapp

class Competition {
    String title;
    Date date;
    static hasMany = [categories: CompCategory];
}
