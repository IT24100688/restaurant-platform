<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String tableType = request.getParameter("tableType");
    session.setAttribute("tableType", tableType); // Store in session
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Form</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f6f5f7;
            display: grid;
            place-content: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 5px 10px 30px #ccc;
            width: 600px;
        }

        h1 {
            text-align: center;
            color: #141E30;
        }

        .infield {
            margin-bottom: 15px;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-family: 'Poppins', sans-serif;
        }

        button {
            width: 100%;
            background: #141E30;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #1823dd;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Enter Customer Details</h1>

    <form action="<%= request.getContextPath() %>/ReservationServlet" method="post">
        <input type="hidden" name="selectedTime" value="<%= request.getParameter("selectedTime") %>">
        <input type="hidden" name="selectedDate" value="<%= request.getParameter("selectedDate") %>">
        <input type="hidden" name="selectedGuests" value="<%= request.getParameter("selectedGuests") %>">
        <input type="hidden" name="hotelName" value="<%= request.getParameter("hotelName") %>">
        <input type="hidden" name="tableType" value="<%= tableType %>">


        <div class="infield">
            <input type="text" name="name" placeholder="Full Name" required>
        </div>
        <div class="infield">
            <input type="email" name="email" placeholder="Email Address" required>
        </div>
        <div class="infield">
            <input type="tel" name="phone" placeholder="Phone Number" required>
        </div>
        <div class="infield">
            <textarea name="requests" placeholder="Special Requests (Optional)"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Proceed to Table Selection</button>
    </form>
</div>
</body>
</html>
