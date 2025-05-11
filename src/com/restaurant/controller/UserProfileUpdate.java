package com.restaurant.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update-profile")
public class UserProfileUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String USERS_FILE = "users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String currentEmail = (String) session.getAttribute("email");

        if (currentEmail == null || currentEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Only get address from the form
        String address = request.getParameter("address");

        // Debug output
        System.out.println("Current email in session: " + currentEmail);
        System.out.println("Form address value: " + address);

        // Input validation for address
        if (address == null || address.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Address field is required");
            request.getRequestDispatcher("/JSP/userProfile.jsp").forward(request, response);
            return;
        }

        // Get the users file
        String usersFilePath = getServletContext().getRealPath("/data/" + USERS_FILE);
        File usersFile = new File(usersFilePath);

        // Read all users
        List<String> users = new ArrayList<>();
        boolean userFound = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(usersFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                // Check if this is the user to update (by email)
                if (parts.length >= 3 && parts[2].equals(currentEmail)) {
                    userFound = true;

                    // Create updated user line (preserving all fields except address)
                    StringBuilder updatedUser = new StringBuilder();
                    updatedUser.append(parts[0]).append(","); // ID
                    updatedUser.append(parts[1]).append(","); // Name (preserved)
                    updatedUser.append(parts[2]).append(","); // Email (preserved)
                    updatedUser.append(parts[3]).append(","); // Password
                    updatedUser.append(parts[4]).append(","); // Phone (preserved)
                    updatedUser.append(address);              // New address

                    users.add(updatedUser.toString());

                    // Update address in session
                    session.setAttribute("address", address);
                } else {
                    users.add(line);
                }
            }
        }

        if (!userFound) {
            request.setAttribute("errorMessage", "User not found");
            request.getRequestDispatcher("/JSP/error.jsp").forward(request, response);
            return;
        }

        // Write updated users back to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(usersFile))) {
            for (String user : users) {
                writer.write(user);
                writer.newLine();
            }
        }

        // Set success message
        request.setAttribute("successMessage", "Address updated successfully");
        session.setAttribute("successMessage", "Address updated successfully");

        // Redirect to user dashboard
        response.sendRedirect("user-dashboard");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to user dashboard
        response.sendRedirect("user-dashboard");
    }
}
