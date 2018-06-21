package edu.acc.vinh.neighborhoodpet;

public class Pet {
    private int petId;
    private String petName;
    private String breed;
    private String gender;
    private int age;
    private String size;
    private String color;
    private boolean isMissing;
    private int ownerId;
    private String bio;

    public Pet(){}
    
    public Pet(String petName, String breed, String gender, Integer age, String size,
        String color, boolean isMissing, int ownerId, String bio) {
        this.petName = petName;
        this.breed = breed;
        this.gender = gender;
        this.age = age;
        this.size = size;
        this.color = color;
        this.isMissing = isMissing;
        this.ownerId = ownerId;
        this.bio = bio;
    }
    
    public int getPetId() {
        return petId;
    }
    
    public void setPetId(int petId) {
        this.petId = petId;
    }
    
    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isMissing() {
        return isMissing;
    }

    public void setIsMissing(boolean isMissing) {
        this.isMissing = isMissing;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }
}
