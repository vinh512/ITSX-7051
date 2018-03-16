package edu.acc.vinh.studentgrades;

public class Student {
    String name;
    double grade;
    static int id = 0;
    int counter = 0;
    
    public Student(String name, double grade) {
        this.name = name;
        this.grade = grade;
        this.counter = ++Student.id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public double getGrade() {
        return this.grade;
    }

    public int getCounter() {
        return counter;
    }
    
    public String getRecord() {
        return "ID# " + getCounter() + ": " + name + " - " + grade;
    }
    
    @Override
    public String toString() {
        return getRecord();
    }

}
