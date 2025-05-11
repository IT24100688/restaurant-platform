package com.restaurant.controller;

import com.restaurant.model.Reservation;
import com.restaurant.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

@WebServlet("/user-dashboard")
public class UserProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("Signup.jsp"); // or login page
            return;
        }

        String userEmail = (String) session.getAttribute("email");

        Queue<Reservation> allReservations = ReservationService.getAllReservations(getServletContext());
        List<Reservation> userReservations = new ArrayList<>();

        for (Reservation r : allReservations) {
            if (r.getEmail().equalsIgnoreCase(userEmail)) {
                userReservations.add(r);
            }
        }

        request.setAttribute("userReservations", userReservations);

        // Optional: re-set profile info in case not in session
        session.setAttribute("name", session.getAttribute("name"));
        session.setAttribute("phone", session.getAttribute("phone"));

        request.getRequestDispatcher("JSP/userProfile.jsp").forward(request, response);
    }
}
