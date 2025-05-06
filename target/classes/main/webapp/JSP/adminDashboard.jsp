<%@ page import="com.restaurant.model.Hotel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | ReservEats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        :root {
            --primary-dark: #141E30;
            --primary-light: #243B55;
            --accent-color: #d32f2f;
            --accent-hover: #b71c1c;
            --text-light: #f8f9fa;
            --sidebar-width: 250px;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f6f5f7;
            color: #333;
        }

        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            background: var(--primary-dark);
            color: white;
            position: fixed;
            padding: 20px 0;
            transition: all 0.3s;
        }

        .sidebar-brand {
            padding: 10px 20px;
            margin-bottom: 30px;
            text-align: center;
        }

        .sidebar-brand h3 {
            color: white;
            font-weight: 600;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu a {
            display: block;
            color: var(--text-light);
            padding: 12px 20px;
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background: rgba(255,255,255,0.1);
            border-left: 3px solid var(--accent-color);
        }

        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .main-content {
            margin-left: var(--sidebar-width);
            padding: 20px;
        }

        .btn-danger-custom {
            background-color: var(--accent-color);
            border: none;
            padding: 8px 20px;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-danger-custom:hover {
            background-color: var(--accent-hover);
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-brand">
        <h3><i class="fas fa-utensils"></i> ReservEats</h3>
    </div>
    <ul class="sidebar-menu">

            <li><a href="#admin"><i class="fas fa-user-shield"></i> Super admin</a></li>
            <li><a href="#restaurants"><i class="fas fa-store"></i> Manage Restaurants</a></li>
            <li><a href="#tables"><i class="fas fa-chair"></i> Table Availability</a></li>
            <li><a href="<%= request.getContextPath() %>/ViewAllReservationsServlet"><i class="fas fa-calendar-check"></i> Reservations</a></li>
            <li><a href="#feedback"><i class="fas fa-comment-dots"></i> Feedbacks</a></li>
            <li><a href="JSP/Logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>

    </ul>
</div>

<!-- Main Content -->
<div class="main-content">
    <h2 class="mb-4">Admin Dashboard</h2>
    <table class="table table-striped">
        <thead class="table-dark">
        <tr>
            <th>No</th>
            <th>Hotel Name</th>
            <th>Description</th>
            <th>Features</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Add Hotel Button -->
        <div class="d-flex justify-content-end mb-3">
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addHotelModal">
                <i class="fas fa-plus-circle"></i> Add Hotel
            </button>
        </div>

        <%
            List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
            if (hotels != null && !hotels.isEmpty()) {
                int counter = 1;
                for (Hotel hotel : hotels) {
                    String modalId = "editModal" + counter;



        %>
        <tr>
            <td><%= counter %></td>
            <td><%= hotel.getName() %></td>
            <td><%= hotel.getDescription() %></td>
            <td><%= String.join(", ", hotel.getFeatures()) %></td>
            <td><img src="<%= hotel.getImageUrl() %>" style="width: 80px; height: auto;"></td>
            <td>
                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#<%= modalId %>">Edit</button>
            </td>
        </tr>

        <!-- Modal -->
        <div class="modal fade" id="<%= modalId %>" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="POST" action="edit-hotel">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit <%= hotel.getName() %></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="originalName" value="<%= hotel.getName()
                             %>"/>
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" name="name" class="form-control" value="<%= hotel.getName() %>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea name="description" class="form-control" required><%= hotel.getDescription() %></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Features</label>
                                <input type="text" name="features" class="form-control" value="<%= hotel.getFeatures().get(0) %>" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Image URL</label>
                                <input type="text" name="imageUrl" class="form-control" value="<%= hotel.getImageUrl() %>">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Save Changes</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
                counter++;
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No hotels found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Add Hotel Modal -->
<div class="modal fade" id="addHotelModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="add-hotel">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Hotel</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Hotel Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Location</label>
                        <input type="text" name="location" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Image URL</label>
                        <input type="text" name="imageUrl" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Features (comma-separated)</label>
                        <input type="text" name="features" class="form-control" placeholder="e.g., Free WiFi,Pool,Spa">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Add Hotel</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
