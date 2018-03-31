package edu.acc.vinh.commenter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    
    private final String comment;
    private final String name;
    private final String timeStamp;
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("d MMM yyyy - h:mm a");
    
    // when a new Comment object is instantiated, the time stamp is generated
    public Comment(String name, String comment) {
        this.name = name;
        this.comment = comment;
        this.timeStamp = setTimeStamp();        
    }

    public String getName() {
        return name;
    }
    
    public String getComment() {
        return comment;
    }
    
    public String getTimeStamp() {
        return timeStamp;
    }
    
    private String setTimeStamp() {
        return dateFormat.format(new Date());
    }

}