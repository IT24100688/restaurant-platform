<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<div class="content">

  <!-- Account Section -->
  <div id="account" class="section active">
    <h2>Account Details</h2>
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

  <!-- Reservations Section -->
  <div id="reservations" class="section">
    <h2>Ongoing Reservations</h2>
    <table>
      <tr>
        <th>Reservation ID</th>
        <th>Date</th>
        <th>Time</th>
        <th>Guests</th>
        <th>Action</th>
      </tr>

      <!-- Placeholder row -->
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
