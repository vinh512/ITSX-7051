package edu.acc.vinh.commenter;

import java.util.ArrayList;

public class CommentManager {
    
    ArrayList<Comment> comments = new ArrayList<>();
    
    public ArrayList<Comment> getAllComments() {
        return comments;
    }
    
    public void addComment(Comment newComment) {
        comments.add(newComment);
    }
    
    @Override
    public String toString() {
        return "this is the arraylist";
    }
    
}
