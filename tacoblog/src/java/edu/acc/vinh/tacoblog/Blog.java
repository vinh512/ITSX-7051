package edu.acc.vinh.tacoblog;

public class Blog {
    
    private final String name;
    private final String title;
    private final String contentBody;

    public Blog(String name, String title, String contentBody) {
        this.name = name;
        this.title = title;
        this.contentBody = contentBody;
    }

    public String getName() {
        return name;
    }
    
    public String getTitle() {
        return title;
    }

    public String getContentBody() {
        return contentBody;
    }
  
}
