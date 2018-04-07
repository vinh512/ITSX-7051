package edu.acc.vinh.tacoblog;

import java.util.ArrayList;

public class UserManager {
    
    ArrayList<User> userList = new ArrayList<>();
    
    // if there was an entry, iterate through list to see if user exists
    public User findUserIfValid(String name, String password) {
        if (name != null && password != null) {
            for (User user : userList) {
                if (user.getName().equals(name) && user.getPassword().equals(password)) {
                    return user;
                }
            }
        }
        return null;
    }
    
    public ArrayList<User> getAllUsers() {
        return userList;
    }
    
    public int getNumberOfUsers() {
        return userList.size();
    }
    
    public void addUser(User newUser) {
        userList.add(newUser);
    }
}
