package edu.acc.vinh.tacoblog;

public class User {
    private final String name;
    private final String password;
 
    public User(String name, String password) {
        this.name = name;
        this.password = PasswordHash.hashPassword(password);
    }

    public String getName() {
        return name;
    }

    public boolean checkPassword(String passwordToTest) {
        return this.password.equals(PasswordHash.hashPassword(passwordToTest));
    }  
    
}
