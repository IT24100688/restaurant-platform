package com.restaurant.controller;

import com.restaurant.model.HotelTableManager;
import com.restaurant.model.Table;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.*;
import java.util.*;

@WebServlet(loadOnStartup = 1, urlPatterns = "/InitServlet")
public class InitServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        HotelTableManager manager = new HotelTableManager();

        String path = getServletContext().getRealPath("/WEB-INF/data/tables.txt");
        File file = new File(path);

        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;

                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split("\\|");
                    if (parts.length != 4) continue;

                    String hotelName = parts[0];
                    manager.addHotel(hotelName);

                    for (int i = 1; i < parts.length; i++) {
                        String[] typeAndCount = parts[i].split(":");
                        if (typeAndCount.length == 2) {
                            String type = typeAndCount[0];
                            int count = Integer.parseInt(typeAndCount[1]);
                            manager.addTable(hotelName, type, count);
                        }
                    }
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        getServletContext().setAttribute("manager", manager);
    }
}
