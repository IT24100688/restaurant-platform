package com.restaurant.controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/table-availability")

    public class TableAvailabilityServlet extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            // Optional: Admin session check

            // Forward to JSP (HotelTableManager is already in application scope)
            request.getRequestDispatcher("/JSP/TableAvailabilityAdmin.jsp").forward(request, response);
        }
    }

