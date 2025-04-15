package com.restaurant.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String USER_FILE = "data/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isValid = false;

        String path = getServletContext().getRealPath(USER_FILE);
        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4) {
                    String storedEmail = parts[1];
                    String storedPassword = parts[3];

                    if (storedEmail.equals(email) && storedPassword.equals(password)) {
                        isValid = true;
                        break;
                    }
                }
            }
        }

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("user", email);
            response.sendRedirect("JSP/userProfile.jsp"); // Redirect to booking page
        } else {
            response.sendRedirect("JSP/Signup.jsp?error=Invalid+credentials");
        }
    }
}
