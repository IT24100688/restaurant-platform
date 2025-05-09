<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.restaurant.model.HotelTableManager" %>
<%@ page import="java.util.*" %>

<%
  HotelTableManager manager = (HotelTableManager) application.getAttribute("manager");
  List<String> hotels = Arrays.asList(
          "Tropical Paradise", "City View Suites", "Mountain Lodge",
          "Luxury Inn", "Urban Retreat", "The Royal Castle"
  );
%>

<html>
<head>
  <title>Table Availability - Admin Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f5f5f5;
      padding: 20px;
    }

    h2 {
      color: #141E30;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
    }

    th, td {
      padding: 12px;
      border: 1px solid #ccc;
      text-align: center;
    }

    th {
      background: #141E30;
      color: white;
    }

    select, input[type="number"] {
      padding: 4px;
      font-size: 14px;
    }

    button {
      padding: 6px 10px;
      margin-left: 4px;
      background-color: #243B55;
      color: white;
      border: none;
      cursor: pointer;
    }

    button:hover {
      background-color: #3e5980;
    }

    .form-inline {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 4px;
    }
  </style>
</head>
<body>

<div class="dashboard-container">
  <h2>Table Availability (Admin Panel)</h2>

  <table>
    <tr>
      <th>Hotel Name</th>
      <th>Outdoor</th>
      <th>VIP</th>
      <th>Family</th>
      <th>Manage Tables</th>
    </tr>

    <% for (String hotel : hotels) {
      Map<String, Integer> counts = manager != null ? manager.getTableCounts(hotel) : new HashMap<>();
    %>
    <tr>
      <td><%= hotel %></td>
      <td><%= counts.getOrDefault("Outdoor", 0) %></td>
      <td><%= counts.getOrDefault("VIP", 0) %></td>
      <td><%= counts.getOrDefault("Family", 0) %></td>
      <td>
        <form action="<%= request.getContextPath() %>/ManageTablesServlet" method="post" class="form-inline">
          <input type="hidden" name="hotelName" value="<%= hotel %>">
          <select name="tableType">
            <option value="Outdoor">Outdoor</option>
            <option value="VIP">VIP</option>
            <option value="Family">Family</option>
          </select>
          <input type="number" name="count" value="1" min="1">
          <button name="action" value="add">+</button>
          <button name="action" value="remove">−</button>
        </form>
      </td>
    </tr>
    <% } %>
  </table>
</div>

</body>
</html>
