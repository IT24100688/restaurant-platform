package com.restaurant.controller;

import com.restaurant.model.Reservation;
import com.restaurant.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationId = "RES" + System.currentTimeMillis();

        // ✅ Matching your form input names
        String date = request.getParameter("selectedDate");
        String time = request.getParameter("selectedTime");
        String guestParam = request.getParameter("selectedGuests");
        int guests = 1;

        try {
            if (guestParam != null && !guestParam.equals("null") && !guestParam.isEmpty()) {
                guests = Integer.parseInt(guestParam);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // fallback to default 1
        }

        // ✅ Get hotel name from session
        HttpSession session = request.getSession();
        String hotelName = request.getParameter("hotelName");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Reservation reservation = new Reservation(
                reservationId, hotelName, date, time, guests, name, email, phone
        );

        if (ReservationService.isAvailable(hotelName, date, time, getServletContext())) {
            ReservationService.saveReservation(reservation, getServletContext());

            session.setAttribute("reservationID", reservationId);
            session.setAttribute("hotelName", hotelName);
            session.setAttribute("date", date);
            session.setAttribute("time", time);
            session.setAttribute("guests", String.valueOf(guests));
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("phone", phone);

            response.sendRedirect("JSP/ReservationConfirm.jsp");
        } else {
            response.sendRedirect("jsp/fullyBooked.jsp");
        }

    }
}
