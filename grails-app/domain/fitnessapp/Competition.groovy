package fitnessapp

class Competition {
    String title;
    Date date;
    
    static hasMany=[athletes:Athlete];
    static constraints = {
        title();
        date();
    }
}
