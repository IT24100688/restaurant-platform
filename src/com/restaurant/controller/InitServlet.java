package com.restaurant.controller;

import com.restaurant.model.HotelTableManager;
import com.restaurant.model.Hotel;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.*;

@WebServlet(loadOnStartup = 1, urlPatterns = "/InitServlet")
public class InitServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        HotelTableManager manager = new HotelTableManager();

        String path = getServletContext().getRealPath("/data/tableData.txt");

        System.out.println("Loading from file: " + path);


        File file = new File(path);

        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    loadHotelFromLine(manager, line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        getServletContext().setAttribute("manager", manager);
    }

    private void loadHotelFromLine(HotelTableManager manager, String line) {
        String[] parts = line.split("\\|");
        if (parts.length < 2) return;

        String hotelName = parts[0];
        manager.addHotel(new Hotel(hotelName, "", "", "", new ArrayList<>()));

        for (int i = 1; i < parts.length; i++) {
            String[] pair = parts[i].split(":");
            if (pair.length == 2) {
                try {
                    String type = pair[0];
                    int count = Integer.parseInt(pair[1]);
                    manager.addTable(hotelName, type, count);
                } catch (NumberFormatException ignored) {}
            }
        }
    }

}
