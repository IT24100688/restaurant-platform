package com.restaurant.controller;

import com.restaurant.model.Reservation;
import com.restaurant.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

    @WebServlet("/user-dashboard")
    public class UserProfileServlet extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("email");

            if (userEmail == null) {
                response.sendRedirect("Signup.jsp"); // Redirect to login/signup
                return;
            }

            // Get all reservations
            Queue<Reservation> allReservations = ReservationService.getAllReservations(getServletContext());

            // Filter only reservations for this user
            List<Reservation> userReservations = allReservations.stream()
                    .filter(r -> r.getEmail().equalsIgnoreCase(userEmail))
                    .collect(Collectors.toList());

            request.setAttribute("reservations", userReservations);

            // Forward to JSP
            request.getRequestDispatcher("JSP/UserProfile.jsp").forward(request, response);
        }
    }


