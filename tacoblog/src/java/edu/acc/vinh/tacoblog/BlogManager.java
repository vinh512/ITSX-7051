package edu.acc.vinh.tacoblog;

import java.util.ArrayList;

public class BlogManager {
    
    ArrayList<Blog> blogList = new ArrayList<>();
    
    public ArrayList<Blog> getAllBlogs() {
        return blogList;
    }
    
    // inserts blog at beginning of ArrayList
    public void addBlog(Blog newBlog) {
        blogList.add(0, newBlog);
    }   
    
}
