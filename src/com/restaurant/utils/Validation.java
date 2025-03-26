package com.restaurant.utils;

public class Validation {
        public static boolean isValidInput(String input) {
            return input != null && !input.trim().isEmpty();
        }
    }

