package com.restaurant.controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginServlet") // Handles login form submission from login.jsp
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.equals("user") && password.equals("password")) {
            response.sendRedirect("jsp/reservationForm.jsp"); // Redirects to reservation page
        } else {
            response.sendRedirect("jsp/login.jsp?error=Invalid credentials");
        }
    }
}
