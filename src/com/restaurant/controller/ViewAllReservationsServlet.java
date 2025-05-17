package com.restaurant.controller;

import com.restaurant.model.Reservation;
import com.restaurant.service.MergeSort;
import com.restaurant.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/ViewAllReservationsServlet")
public class ViewAllReservationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get reservations from file
        Queue<Reservation> reservationQueue = ReservationService.getAllReservations(getServletContext());

        // 2. Convert to list for sorting
        List<Reservation> reservationList = new ArrayList<>(reservationQueue);

        // 3. Sort the list using Merge Sort (by date & time)
        MergeSort.sort(reservationList);

        // 4. Convert back to sorted queue
        Queue<Reservation> sortedQueue = new LinkedList<>(reservationList);

        // 5. Send to JSP
        request.setAttribute("reservations", sortedQueue);
        request.getRequestDispatcher("JSP/viewAllReservations.jsp").forward(request, response);
    }
}
