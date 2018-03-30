package edu.acc.vinh.commenter;

public class Comment {
    
    private final String comment;
    private final String name;
    
    public Comment(String name, String comment) {
        this.name = name;
        this.comment = comment;
    }

    Comment(String comment) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getName() {
        return name;
    }
    
    public String getComment() {
        return comment;
    }
    
}
