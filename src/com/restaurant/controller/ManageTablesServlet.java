package com.restaurant.controller;

import com.restaurant.model.HotelTableManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ManageTablesServlet")
public class ManageTablesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String hotel = request.getParameter("hotelName");
        String action = request.getParameter("action"); // "add" or "remove"
        String type = request.getParameter("tableType");
        int count = Integer.parseInt(request.getParameter("count"));

        // ✅ Correct: Access manager from ServletContext
        HotelTableManager manager = (HotelTableManager) getServletContext().getAttribute("manager");

        if (manager != null) {
            if ("add".equalsIgnoreCase(action)) {
                manager.addTable(hotel, type, count);
            } else if ("remove".equalsIgnoreCase(action)) {
                for (int i = 0; i < count; i++) {
                    manager.removeTable(hotel, type);
                }
            }
        }

        response.sendRedirect("adminDashboard.jsp");
    }
}
