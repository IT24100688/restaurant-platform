<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String reservationID = (String) session.getAttribute("reservationID");
  String hotel = (String) session.getAttribute("hotelName");
  String name = (String) session.getAttribute("name");
  String email = (String) session.getAttribute("email");
  String phone = (String) session.getAttribute("phone");
  String date = (String) session.getAttribute("date");
  String time = (String) session.getAttribute("time");
  String guests = (String) session.getAttribute("guests");
  String tableType = (String) session.getAttribute("tableType");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Reservation Confirmed</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #141E30;
      padding: 40px;
    }
    .confirmation {
      max-width: 600px;
      margin: auto;
      background: white;
      padding: 25px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      border-radius: 8px;
    }
    .confirmation h2 {
      color: #2ecc71;
    }
    .confirmation p {
      font-size: 16px;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<div class="confirmation">
  <h2>Reservation Confirmed!</h2>
  <p><strong>Reservation ID:</strong> <%= reservationID %></p>
  <p><strong>Hotel:</strong> <%= hotel %></p>
  <p><strong>Date:</strong> <%= date %></p>
  <p><strong>Time:</strong> <%= time %></p>
  <p><strong>Guests:</strong> <%= guests %></p>
  <p><strong>Table type</strong> <%= tableType%></p>
  <p><strong>Name:</strong> <%= name %></p>
  <p><strong>Email:</strong> <%= email %></p>
  <p><strong>Phone:</strong> <%= phone %></p>

</div>
</body>
</html>
