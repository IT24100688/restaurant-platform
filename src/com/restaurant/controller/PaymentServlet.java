package com.restaurant.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get session and reservation info
        HttpSession session = request.getSession();
        String reservationID = (String) session.getAttribute("reservationID");
        String date = (String) session.getAttribute("date");
        String time = (String) session.getAttribute("time");
        String guests = (String) session.getAttribute("guests");
        String username = (String) session.getAttribute("username");
        if (username == null) username = "guest";

        // Get customer input
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String requests = request.getParameter("requests");

        // Save customer info to session
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("requests", requests);

        // Save to file
        String filePath = "C:\\Users\\Ranuda Perera\\Desktop\\rest-plat\\.idea\\data\\reservations.txt";
        File file = new File(filePath);
        file.getParentFile().mkdirs(); // Create folder if missing

        BufferedWriter writer = new BufferedWriter(new FileWriter(file, true));
        writer.write(reservationID + "," + username + "," + date + "," + time + "," + guests + "," + name + "," + email + "," + phone);
        writer.newLine();
        writer.close();

        // Redirect to success confirmation
        response.sendRedirect(request.getContextPath() + "/JSP/PaymentPortal.jsp");
    }
}

