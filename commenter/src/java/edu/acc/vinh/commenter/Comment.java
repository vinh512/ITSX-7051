package edu.acc.vinh.commenter;

public class Comment {
    
    private final String comment;
    private final String name;
    private final String email;
    
    public Comment(String comment, String name, String email) {
        this.comment = comment;
        this.name = name;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    
    
}
