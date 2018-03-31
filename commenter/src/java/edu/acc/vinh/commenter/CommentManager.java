package edu.acc.vinh.commenter;

import java.util.ArrayList;

public class CommentManager {
    
    ArrayList<Comment> comments = new ArrayList<>();
    
    // returns the ArrayList
    public ArrayList<Comment> getAllComments() {
        return comments;
    }
    
    // adds a new comment to the ArrayList
    public void addComment(Comment newComment) {
        comments.add(newComment);
    }

}
