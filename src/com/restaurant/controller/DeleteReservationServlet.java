package com.restaurant.controller;

import com.restaurant.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.LinkedList;
import java.util.Queue;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {

    private static final String FILE_PATH = "/data/reservations.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationId = request.getParameter("reservationId");
        String filePath = getServletContext().getRealPath(FILE_PATH);
        Queue<Reservation> updatedQueue = new LinkedList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 8 && !parts[0].equals(reservationId)) {
                    updatedQueue.add(new Reservation(
                            parts[0], parts[1], parts[2], parts[3],
                            Integer.parseInt(parts[4]), parts[5], parts[6], parts[7], parts[8]
                    ));
                }
            }
        }

        // Rewrite the updated queue to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Reservation r : updatedQueue) {
                writer.write(r.toFileString());
                writer.newLine();
            }
        }

        request.setAttribute("message", "Reservation successfully deleted!");
        request.setAttribute("reservations", updatedQueue);
        request.getRequestDispatcher("jsp/viewAllReservations.jsp").forward(request, response);
    }
}
