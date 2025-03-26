package com.restaurant.service;
import com.restaurant.model.User;
import java.util.ArrayList;
import java.util.List;


    public class AdminService {
        private static List<User> users = new ArrayList<>();

        public static void addUser(String username, String password) {
            users.add(new User(username, password));
        }

        public static void removeUser(String username) {
            users.removeIf(user -> user.getUsername().equals(username));
        }

        public static List<User> getAllUsers() {
            return users;
        }
    }


