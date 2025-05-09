package com.restaurant.controller;

import com.restaurant.model.HotelTableManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/ManageTablesServlet")
public class ManageTablesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String hotel = request.getParameter("hotelName");
        String type = request.getParameter("tableType");
        String action = request.getParameter("action");
        int count = Integer.parseInt(request.getParameter("count"));

        HotelTableManager manager = (HotelTableManager) getServletContext().getAttribute("manager");

        if (manager != null && hotel != null && type != null) {
            if ("add".equalsIgnoreCase(action)) {
                manager.addTable(hotel, type, count);
            } else if ("remove".equalsIgnoreCase(action)) {
                for (int i = 0; i < count; i++) {
                    manager.removeTable(hotel, type);
                }
            }

            // ✅ Save the updated table counts to file
            saveTableDataToFile(manager);
        }

        response.sendRedirect("JSP/TableAvailabilityAdmin.jsp");
    }

    private void saveTableDataToFile(HotelTableManager manager) {
        String path = getServletContext().getRealPath("/WEB-INF/data/tables.txt");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
            for (String hotel : manager.getAllHotelNames()) {
                writer.write(manager.getHotelDataLine(hotel));
                writer.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
