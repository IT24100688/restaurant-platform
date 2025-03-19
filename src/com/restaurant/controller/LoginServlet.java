package com.restaurant.controller;

import com.restaurant.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

import java.io.IOException;

    public class LoginServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if ("admin".equals(username) && "admin123".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", new User(username, password));
                response.sendRedirect("reservationForm.jsp");
            } else {
                response.sendRedirect("login.jsp?error=Invalid credentials");
            }
        }
    }


