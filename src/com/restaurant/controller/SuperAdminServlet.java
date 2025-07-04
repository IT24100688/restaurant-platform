package com.restaurant.controller;
import com.restaurant.model.Admin;
import com.restaurant.model.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/super-admin-dashboard")
    public class SuperAdminServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            List<Admin> admins = AdminService.loadAdmins(getServletContext());
            request.setAttribute("admins", admins);
            request.getRequestDispatcher("JSP/manageAdmins.jsp").forward(request, response);
        }
    }

