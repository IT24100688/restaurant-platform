<%@ page import="com.restaurant.service.ReservationService" %>
<%@ page import="com.restaurant.model.Reservation" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

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

</body>
</html>
