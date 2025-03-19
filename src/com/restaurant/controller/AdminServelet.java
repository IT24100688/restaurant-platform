package com.restaurant.controller;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

    public class AdminServelet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if ("admin".equals(username) && "admin123".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("adminLog.jsp?error=Invalid credentials");
            }
        }
    }


