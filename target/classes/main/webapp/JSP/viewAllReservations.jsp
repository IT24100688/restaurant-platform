<%@ page import="com.restaurant.service.ReservationService" %>
<%@ page import="com.restaurant.model.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>

      <h2>All Reservations</h2>
      <table border="1">
      <tr><th>Name</th><th>Contact</th><th>Time</th></tr>
      <%
        List<Reservation> reservations = ReservationService.getAllReservations();
        for (Reservation res : reservations) {
      %>
      <tr>
      <td><%= res.getName() %></td>
      <td><%= res.getContact() %></td>
      <td><%= res.getReservationTime() %></td>
      </tr>
      <% } %>
      </table>
    </title>
</head>
<body>

</body>
</html>
