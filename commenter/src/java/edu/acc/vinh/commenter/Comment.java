package edu.acc.vinh.commenter;

public class Comment {
    
    private final String comment;
    private final String name;
    
    public Comment(String name, String comment) {
        this.name = name;
        this.comment = comment;
    }

    public String getName() {
        return name;
    }
    
    public String getComment() {
        return comment;
    }
    
}
