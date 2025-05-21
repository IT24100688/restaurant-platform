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

        if ("add".equalsIgnoreCase(action)) {
            manager.addTable(hotel, type, count);
        } else if ("remove".equalsIgnoreCase(action)) {
            for (int i = 0; i < count; i++) {
                manager.removeTable(hotel, type);
            }
        }

        // ✅ Save updated manager to context (optional for consistency)
        getServletContext().setAttribute("manager", manager);

        // ✅ Save to file
        saveTableDataToFile(manager);

        response.sendRedirect("JSP/TableAvailabilityAdmin.jsp");
    }

    private void saveTableDataToFile(HotelTableManager manager) {
        String path = getServletContext().getRealPath("/data/tableData.txt");
        System.out.println("Saving to file: " + path);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
            for (String hotel : manager.getAllHotelNames()) {


                int[] counts = manager.getTableCounts(hotel);

                int vip = counts[0];
                int outdoor = counts[1];
                int family = counts[2];

                String line = hotel + "|VIP:" + vip + "|Family:" + family + "|Outdoor:" + outdoor;
                writer.write(line);
                writer.newLine();

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
