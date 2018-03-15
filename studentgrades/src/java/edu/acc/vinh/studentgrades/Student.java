package edu.acc.vinh.studentgrades;

public class Student {
    String name;
    double grade;
    
    public Student(String name, double grade) {
        this.name = name;
        this.grade = grade;
    }
    
    public String getName() {
        return this.name;
    }
    
    public double getGrade() {
        return this.grade;
    }
    
    public String getRecord() {
        return name + " - " + grade;
    }
    
    @Override
    public String toString() {
        return "[" + getRecord() + "]";
    }
}
