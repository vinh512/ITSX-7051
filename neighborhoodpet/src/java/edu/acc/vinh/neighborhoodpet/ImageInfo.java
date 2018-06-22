package edu.acc.vinh.neighborhoodpet;

public class ImageInfo {
    private final int id;
    private final String fileName;
    private final String contentType;
    private int ownerId;
    
    public ImageInfo(int id, String fileName, String contentType, int ownerId) {
        this.id = id;
        this.fileName = fileName;
        this.contentType = contentType;
        this.ownerId = ownerId;
    }

    public int getId() {
        return id;
    }

    public String getFileName() {
        return fileName;
    }

    public String getContentType() {
        return contentType;
    }  

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }
}