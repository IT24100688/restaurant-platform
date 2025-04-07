<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reservation Confirmed</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #141E30, #243B55);
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .card {
      background: white;
      color: #141E30;
      padding: 40px;
      border-radius: 10px;
      width: 600px;
      box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
      text-align: center;
    }

    h1 {
      margin-bottom: 10px;
    }

    p {
      font-size: 16px;
      margin: 8px 0;
    }

    .success {
      color: green;
      font-weight: bold;
      margin: 15px 0;
    }

    .btn {
      display: inline-block;
      margin-top: 20px;
      background-color: #141E30;
      color: white;
      padding: 10px 25px;
      border: none;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
    }

    .btn:hover {
      background-color: #1823dd;
    }
  </style>
</head>
<body>
<div class="card">
  <h1>Reservation Confirmed !</h1>
  <p class="success">Payment Successful!</p>

  <p><strong>Reservation ID:</strong> <%= session.getAttribute("reservationID") %></p>
  <p><strong>Name:</strong> <%= session.getAttribute("name") %></p>
  <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
  <p><strong>Phone:</strong> <%= session.getAttribute("phone") %></p>
  <p><strong>Date:</strong> <%= session.getAttribute("date") %></p>
  <p><strong>Time:</strong> <%= session.getAttribute("time") %></p>
  <p><strong>Guests:</strong> <%= session.getAttribute("guests") %></p>

  <a class="btn" href="<%= request.getContextPath() %>/JSP/booking.jsp">Make Another Reservation</a>
</div>
</body>
</html>
