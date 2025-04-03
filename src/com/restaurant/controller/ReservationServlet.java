package com.restaurant.controller; // Use your actual package name

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/ReservationServlet") // This matches the form's action
public class ReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get booking form data
        String guests = request.getParameter("selectedGuests");
        String date = request.getParameter("selectedDate");
        String time = request.getParameter("selectedTime");

        // Generate a reservation ID using timestamp
        String reservationID = "RES" + System.currentTimeMillis();

        // Get username from session (optional if you’re using login)
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null) {
            username = "guest";
        }

        // Save reservation to file
        String filePath = "C:\\Users\\Ranuda Perera\\Desktop\\rest-plat\\.idea\\data\\reservations.txt"; // change to your actual path
        File file = new File(filePath);
        file.getParentFile().mkdirs(); // create directory if it doesn't exist

        BufferedWriter writer = new BufferedWriter(new FileWriter(file, true)); // append mode
        writer.write(reservationID + "," + username + "," + date + "," + time + "," + guests);
        writer.newLine();
        writer.close();

        session.setAttribute("reservationID", reservationID);
        session.setAttribute("guests", guests);
        session.setAttribute("date", date);
        session.setAttribute("time", time);

        // Redirect to confirmation page
        response.sendRedirect(request.getContextPath() + "/JSP/reservationForm.jsp");

    }
}
