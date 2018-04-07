package edu.acc.vinh.tacoblog;

import java.util.ArrayList;

public class BlogManager {
    
    ArrayList<Blog> blogList = new ArrayList<>();
    
    public ArrayList<Blog> getAllBlogs() {
        return blogList;
    }
    
    public void addBlog(Blog newBlog) {
        blogList.add(newBlog);
    }   
    
}
