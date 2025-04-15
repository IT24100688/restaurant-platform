package com.restaurant.controller;

import com.restaurant.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.LinkedList;
import java.util.Queue;

@WebServlet("/EditReservationServlet")
public class EditReservationServlet extends HttpServlet {

    private static final String FILE_PATH = "/data/reservations.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationId = request.getParameter("reservationId");

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String path = getServletContext().getRealPath(FILE_PATH);
        Queue<Reservation> updatedQueue = new LinkedList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");

                if (parts.length >= 8) {
                    if (parts[0].equals(reservationId)) {
                        // Replace with updated reservation
                        Reservation updated = new Reservation(
                                reservationId,
                                parts[1],  // role
                                date,
                                time,
                                guests,
                                name,
                                email,
                                phone
                        );
                        updatedQueue.add(updated);
                    } else {
                        // Keep existing reservation
                        updatedQueue.add(new Reservation(
                                parts[0], parts[1], parts[2], parts[3],
                                Integer.parseInt(parts[4]), parts[5], parts[6], parts[7]
                        ));
                    }
                }
            }
        }

        // Write updated queue back to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
            for (Reservation r : updatedQueue) {
                writer.write(r.toFileString());
                writer.newLine();
            }
        }

        request.setAttribute("message", "Reservation updated successfully!");
        request.setAttribute("reservations", updatedQueue);
        request.getRequestDispatcher("JSP/viewAllReservations.jsp").forward(request, response);
    }
}
