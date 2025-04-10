package com.restaurant.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final String USER_FILE = "data/users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String password = request.getParameter("password");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(USER_FILE, true))) {
            writer.write(name + "," + email + "," + number + "," + password);
            writer.newLine();
        }

        response.sendRedirect("Signup.jsp"); // redirect to login or confirmation
    }
}
