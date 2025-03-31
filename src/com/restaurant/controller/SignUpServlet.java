package com.restaurant.controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final String FILE_PATH = ".idea/data/users.txt"; // Adjust path as needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("Name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            out.println("<script>alert('All fields are required!'); window.location='signup.jsp';</script>");
            return;
        }

        // Save user data to a file (simulating database storage)
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(name + "," + email + "," + password);
            writer.newLine();
        }

        out.println("<script>alert('Signup successful!'); window.location='login.jsp';</script>");
    }
}
