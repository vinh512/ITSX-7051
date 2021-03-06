package edu.acc.vinh.tacoblog;

import java.util.ArrayList;

public class UserManager {
    
    // create empty ArrayList
    ArrayList<User> userList = new ArrayList<>();
    
    // if there was an entry, iterate through list to see if user exists
    public User findUserIfValid(String name, String password) {
        if (name != null && password != null) {
            for (User user : userList) {
                if (user.getName().equals(name) && user.checkPassword(password)) {
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
    
    public void addUser(User userNew) {
        userList.add(userNew);
    }
    
}
