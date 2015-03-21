package fitnessapp

class AthletePoint {
    
    Integer point1 = 0;
    Integer point2 = 0;
    String comment;
    static belongsTo = [athlete : Athlete, protocol : Protocol];
    static constraints = {
        comment nullable: true;
    }
}
