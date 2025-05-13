<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Super Admin Dashboard | ReservEats</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-dark: #141E30;
      --primary-light: #243B55;
      --accent-color: #d32f2f;
      --accent-hover: #b71c1c;
      --text-light: #f8f9fa;
      --sidebar-width: 250px;
      --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f8fafc;
      color: #333;
    }

    .sidebar {
      width: var(--sidebar-width);
      height: 100vh;
      background: linear-gradient(to bottom, var(--primary-dark), var(--primary-light));
      color: white;
      position: fixed;
      padding: 20px 0;
      box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
      z-index: 1000;
    }

    .sidebar-brand {
      padding: 10px 20px;
      margin-bottom: 30px;
      text-align: center;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .sidebar-brand h3 {
      color: white;
      font-weight: 600;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .sidebar-brand i {
      margin-right: 10px;
      font-size: 1.5rem;
    }

    .sidebar-menu {
      list-style: none;
      padding: 0 15px;
    }

    .sidebar-menu li {
      margin-bottom: 5px;
      border-radius: 5px;
      overflow: hidden;
    }

    .sidebar-menu a {
      display: flex;
      align-items: center;
      color: rgba(255, 255, 255, 0.8);
      padding: 12px 15px;
      text-decoration: none;
      transition: all 0.3s;
      border-left: 3px solid transparent;
      font-weight: 500;
    }

    .sidebar-menu a:hover, .sidebar-menu a.active {
      background: rgba(255, 255, 255, 0.1);
      border-left: 3px solid var(--accent-color);
      color: white;
      transform: translateX(5px);
    }

    .sidebar-menu i {
      margin-right: 12px;
      width: 20px;
      text-align: center;
      font-size: 1.1rem;
    }

    .main-content {
      margin-left: var(--sidebar-width);
      padding: 30px;
      min-height: 100vh;
    }

    .page-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eaeaea;
    }

    .page-header h2 {
      color: var(--primary-dark);
      font-weight: 600;
      margin: 0;
    }

    .admin-card {
      background: white;
      border-radius: 10px;
      box-shadow: var(--card-shadow);
      padding: 20px;
      margin-bottom: 30px;
    }

    .admin-card h3 {
      color: var(--primary-dark);
      margin-bottom: 20px;
      font-weight: 500;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-control {
      padding: 10px 15px;
      border: 1px solid #ddd;
      border-radius: 6px;
      width: 100%;
      transition: all 0.3s;
    }

    .form-control:focus {
      border-color: var(--primary-light);
      box-shadow: 0 0 0 3px rgba(36, 59, 85, 0.2);
    }

    .btn-primary {
      background-color: var(--primary-light);
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      color: white;
      font-weight: 500;
      transition: all 0.3s;
    }

    .btn-primary:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
    }

    .btn-danger {
      background-color: var(--accent-color);
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      color: white;
      font-weight: 500;
      transition: all 0.3s;
    }

    .btn-danger:hover {
      background-color: var(--accent-hover);
      transform: translateY(-2px);
    }

    .admin-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      margin-top: 20px;
    }

    .admin-table thead {
      background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
      color: white;
    }

    .admin-table th {
      padding: 15px;
      text-align: left;
      font-weight: 500;
    }

    .admin-table td {
      padding: 12px 15px;
      border-bottom: 1px solid #eee;
    }

    .admin-table tr:last-child td {
      border-bottom: none;
    }

    .admin-table tr:hover {
      background-color: rgba(36, 59, 85, 0.05);
    }

    .no-data {
      text-align: center;
      padding: 50px;
      color: #6c757d;
    }

    .no-data i {
      font-size: 3rem;
      margin-bottom: 20px;
      color: #dee2e6;
    }

    @media (max-width: 768px) {
      .sidebar {
        width: 70px;
        overflow: hidden;
      }
      .sidebar-brand h3 span {
        display: none;
      }
      .sidebar-menu a span {
        display: none;
      }
      .sidebar-menu i {
        margin-right: 0;
        font-size: 1.3rem;
      }
      .main-content {
        margin-left: 70px;
      }
    }
  </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
  <div class="sidebar-brand">
    <h3><i class="fas fa-utensils"></i> <span>ReservEats</span></h3>
  </div>
  <ul class="sidebar-menu">
    <li><a href="<%=request.getContextPath()%>/super-admin-dashboard" class="active"><i class="fas fa-user-shield"></i> <span>Super Admin</span></a></li>

</div>

<!-- Main Content -->
<div class="main-content">
  <div class="page-header">
    <h2><i class="fas fa-user-shield me-2"></i>Super Admin Panel</h2>
  </div>

  <!-- Add Admin Card -->
  <div class="admin-card">
    <h3>Add New Admin</h3>
    <form action="add-admin" method="post">
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">
        <i class="fas fa-plus-circle me-2"></i> Add Admin
      </button>
    </form>
  </div>

  <!-- Remove Admin Card -->
  <div class="admin-card">
    <h3>Remove Admin</h3>
    <form action="remove-admin" method="post">
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <input type="text" name="username" class="form-control" placeholder="Username to remove" required>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-danger">
        <i class="fas fa-user-minus me-2"></i> Remove Admin
      </button>
    </form>
  </div>

  <!-- Admin List -->
  <div class="admin-card">
    <h3>Current Admins</h3>
    <%
      List<Admin> admins = (List<Admin>) request.getAttribute("admins");
      if (admins != null && !admins.isEmpty()) {
    %>
    <table class="admin-table">
      <thead>
      <tr>
        <th>Username</th>
        <th>Password</th>
      </tr>
      </thead>
      <tbody>
      <% for (Admin a : admins) { %>
      <tr>
        <td><%= a.getUsername() %></td>
        <td><%= a.getPassword() %></td>
      </tr>
      <% } %>
      </tbody>
    </table>
    <% } else { %>
    <div class="no-data">
      <i class="fas fa-user-shield"></i>
      <h4>No Admins Found</h4>
      <p>Add admins to manage the system</p>
    </div>
    <% } %>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Add active class to current menu item
  document.addEventListener('DOMContentLoaded', function() {
    const currentPage = window.location.pathname.split('/').pop();
    const menuItems = document.querySelectorAll('.sidebar-menu a');

    menuItems.forEach(item => {
      if (item.getAttribute('href').includes(currentPage)) {
        item.classList.add('active');
      }
    });
  });
</script>
</body>
</html>