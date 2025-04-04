<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #f6f5f7;
      padding: 40px;
    }

    .container {
      max-width: 1000px;
      margin: auto;
    }

    h2 {
      color: #141E30;
    }

    .section {
      background: white;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 0 20px #ccc;
      margin-bottom: 40px;
    }

    label {
      display: block;
      margin-top: 10px;
      font-weight: bold;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }

    .btn {
      background-color: #141E30;
      color: white;
      padding: 10px 20px;
      border: none;
      font-weight: bold;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn:hover {
      background-color: #1823dd;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #243B55;
      color: white;
    }

    .cancel-btn {
      background: crimson;
      color: white;
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .cancel-btn:hover {
      background: darkred;
    }
  </style>
</head>
<body>

<div class="container">

  <div class="section">
    <h2>My Account</h2>
    <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="post">
      <label>Full Name</label>
      <input type="text" name="name" value="<%= session.getAttribute("name") %>" required>

      <label>Email</label>
      <input type="email" name="email" value="<%= session.getAttribute("email") %>" required>

      <label>Phone</label>
      <input type="text" name="phone" value="<%= session.getAttribute("phone") %>" required>

      <button type="submit" class="btn">Update Info</button>
    </form>
  </div>

  <div class="section">
    <h2>My Reservations</h2>

    <table>
      <tr>
        <th>Reservation ID</th>
        <th>Date</th>
        <th>Time</th>
        <th>Guests</th>
        <th>Action</th>
      </tr>

      <tr>
        <td>RES123456789</td>
        <td>2025-04-02</td>
        <td>8:30 PM</td>
        <td>2</td>
        <td>
          <form action="<%= request.getContextPath() %>/CancelReservationServlet" method="post">
            <input type="hidden" name="reservationID" value="RES123456789">
            <button type="submit" class="cancel-btn">Cancel</button>
          </form>
        </td>
      </tr>

    </table>
  </div>
</div>

</body>
</html>
