package com.restaurant.controller;
import com.restaurant.model.Reservation;
import com.restaurant.service.ReservationService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String reservationTime = request.getParameter("reservationTime");

        Reservation reservation = new Reservation(name, contact, reservationTime);
        ReservationService.addReservation(reservation);

        response.sendRedirect("viewReservations.jsp");
    }
}