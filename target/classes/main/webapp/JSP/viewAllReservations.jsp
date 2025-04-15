<%@ page import="java.util.Queue" %>
<%@ page import="com.restaurant.model.Reservation" %>
<%
  Queue<Reservation> reservations = (Queue<Reservation>) request.getAttribute("reservations");
  String msg = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
  <title>View Reservations</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
  <h2>All Reservations</h2>

  <% if (msg != null) { %>
  <div class="alert alert-success"><%= msg %></div>
  <% } %>

  <table class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>ID</th><th>Role</th><th>Date</th><th>Time</th>
      <th>Guests</th><th>Name</th><th>Email</th><th>Phone</th><th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      if (reservations != null && !reservations.isEmpty()) {
        int count = 0;
        for (Reservation r : reservations) {
          count++;
    %>
    <tr>
      <td><%= r.getReservationId() %></td>
      <td><%= r.getHotelName() %></td>
      <td><%= r.getDate() %></td>
      <td><%= r.getTime() %></td>
      <td><%= r.getGuests() %></td>
      <td><%= r.getName() %></td>
      <td><%= r.getEmail() %></td>
      <td><%= r.getPhone() %></td>
      <td>
        <!-- Edit Button -->
        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal<%= count %>">Edit</button>

        <!-- Delete Form -->
        <form action="DeleteReservationServlet" method="post" style="display:inline;">
          <input type="hidden" name="reservationId" value="<%= r.getReservationId() %>"/>
          <button class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
        </form>
      </td>
    </tr>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal<%= count %>" tabindex="-1" aria-labelledby="modalLabel<%= count %>" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <form action="EditReservationServlet" method="post">
            <div class="modal-header">
              <h5 class="modal-title" id="modalLabel<%= count %>">Edit Reservation</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <input type="hidden" name="reservationId" value="<%= r.getReservationId() %>">

              <div class="mb-3">
                <label>Date</label>
                <input type="date" name="date" class="form-control" value="<%= r.getDate() %>">
              </div>
              <div class="mb-3">
                <label>Time</label>
                <input type="text" name="time" class="form-control" value="<%= r.getTime() %>">
              </div>
              <div class="mb-3">
                <label>Guests</label>
                <input type="number" name="guests" class="form-control" value="<%= r.getGuests() %>">
              </div>
              <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" value="<%= r.getName() %>">
              </div>
              <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="<%= r.getEmail() %>">
              </div>
              <div class="mb-3">
                <label>Phone</label>
                <input type="text" name="phone" class="form-control" value="<%= r.getPhone() %>">
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-success">Save Changes</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <%
      } // end for
    } else {
    %>
    <tr><td colspan="9" class="text-center">No reservations found.</td></tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
