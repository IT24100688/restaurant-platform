package com.restaurant.controller;


import com.restaurant.model.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/remove-admin")
    public class removeAdminsServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String username = request.getParameter("username");
            AdminService.removeAdminByUsername(username, getServletContext());

            response.sendRedirect("super-admin-dashboard");
        }
    }


