<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.restaurant.model.Reservation, com.restaurant.model.User, com.restaurant.service.ReservationService" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Dashboard</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      background: #f6f5f7;
      display: flex;
      height: 100vh;
    }

    .sidebar {
      width: 220px;
      background: #141E30;
      color: white;
      display: flex;
      flex-direction: column;
      padding: 30px 15px;
    }

    .sidebar h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    .nav-link {
      background: none;
      color: white;
      border: none;
      padding: 12px 15px;
      text-align: left;
      font-size: 16px;
      cursor: pointer;
      transition: 0.2s ease;
    }

    .nav-link:hover {
      background: #1823dd;
      border-radius: 5px;
    }

    .content {
      flex: 1;
      padding: 30px;
    }

    .section {
      background: white;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 0 20px #ccc;
      display: none;
    }

    .section.active {
      display: block;
    }

    label, input {
      display: block;
      margin-bottom: 10px;
    }

    input {
      padding: 8px;
      width: 100%;
      border-radius: 4px;
      border: 1px solid #ccc;
    }

    .btn {
      margin-top: 10px;
      padding: 10px 15px;
      background-color: #141E30;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
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

<div class="sidebar">
  <h2>My Profile</h2>
  <button class="nav-link" onclick="showSection('account')">👤 Account</button>
  <button class="nav-link" onclick="showSection('reservations')">📅 Reservations</button>
</div>

<%
  User user = new User(
          (String) session.getAttribute("name"),
          (String) session.getAttribute("email"),
          (String) session.getAttribute("phone"),
          ""  // password not needed here
  );
  List<Reservation> userReservations = new ArrayList<>();

  if (user != null) {
    Queue<Reservation> allReservations = ReservationService.getAllReservations(application);
    for (Reservation r : allReservations) {
      if (r.getEmail().equalsIgnoreCase(user.getEmail())) {
        userReservations.add(r);
      }
    }
  }
%>

<div class="content">

  <!-- Account Section -->
  <div id="account" class="section active">
    <h2>Account Details</h2>
    <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="post">
      <label>Full Name</label>
      <input type="text" name="name" value="<%= user != null ? user.getName() : "" %>" required>

      <label>Email</label>
      <input type="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" required>

      <label>Phone</label>
      <input type="text" name="phone" value="<%= user != null ? user.getPhone() : "" %>" required>

      <button type="submit" class="btn">Update Info</button>
    </form>
  </div>

  <!-- Reservations Section -->
  <div id="reservations" class="section">
    <h2>Ongoing Reservations</h2>

    <% if (!userReservations.isEmpty()) { %>
    <table>
      <thead>
      <tr>
        <th>Reservation ID</th>
        <th>Hotel</th>
        <th>Date</th>
        <th>Time</th>
        <th>Guests</th>
        <th>Table Type</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <% for (Reservation r : userReservations) { %>
      <tr>
        <td><%= r.getReservationId() %></td>
        <td><%= r.getHotelName() %></td>
        <td><%= r.getDate() %></td>
        <td><%= r.getTime() %></td>
        <td><%= r.getGuests() %></td>
        <td><%= r.gettableType() != null ? r.gettableType() : "Not selected" %></td>
        <td>
          <form action="cancel-reservation" method="post" onsubmit="return confirm('Cancel this reservation?');">
            <input type="hidden" name="reservationId" value="<%= r.getReservationId() %>">
            <button type="submit" class="cancel-btn">Cancel</button>
          </form>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
    <% } else { %>
    <p>No reservations found.</p>
    <% } %>

  </div>

</div>

<script>
  function showSection(id) {
    document.querySelectorAll('.section').forEach(div => {
      div.classList.remove('active');
    });
    document.getElementById(id).classList.add('active');
  }
</script>

</body>
</html>
