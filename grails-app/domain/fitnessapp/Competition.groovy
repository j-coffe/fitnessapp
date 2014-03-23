package fitnessapp

import org.grails.databinding.BindingFormat

class Competition {
    String title;
    @BindingFormat('yyyy-MM-dd')
    Date date;
    
    static hasMany=[athletes:Athlete, judges:Judge, ccategories:CCategory];
}
