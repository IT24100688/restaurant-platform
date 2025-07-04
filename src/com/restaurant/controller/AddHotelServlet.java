package com.restaurant.controller;


import com.restaurant.model.Hotel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/add-hotel")
public class AddHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get hotel details from form
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String imageUrl = request.getParameter("imageUrl");
        String featuresStr = request.getParameter("features");

        // 2. Validate input (simple check)
        if (name == null || name.isEmpty()) {
            response.sendRedirect("admin-dashboard?error=Missing name");
            return;
        }

        // 3. Parse features into list
        List<String> features = new ArrayList<>();
        if (featuresStr != null && !featuresStr.isEmpty()) {
            features = Arrays.asList(featuresStr.split("\\s*,\\s*"));
        }

        // 4. Create hotel line format for hotels.txt
        String hotelLine = String.join("|",
                name,
                description,
                location,
                imageUrl,
                String.join(",", features)
        );

        // 5. Write to file
        String filePath = getServletContext().getRealPath("/data/hotels.txt");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.newLine(); // move to next line
            writer.write(hotelLine);
        }

        // Add default table data for the new hotel
        String tableDataPath = getServletContext().getRealPath("/data/tableData.txt");
        try (BufferedWriter tableWriter = new BufferedWriter(new FileWriter(tableDataPath, true))) {
            // Default values: 2 VIP tables, 3 Family tables, 1 Outdoor table
            String tableDataLine = name + "|VIP:1|Family:1|Outdoor:1";
            tableWriter.newLine(); // move to next line
            tableWriter.write(tableDataLine);
        }


        // 6. Redirect back to dashboard
        response.sendRedirect("admin-dashboard");
    }
}
