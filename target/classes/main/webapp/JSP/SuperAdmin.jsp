
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Superadmin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .dashboard-card {
      transition: transform 0.3s;
    }
    .dashboard-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Superadmin Panel</a>
    <div class="navbar-nav">
      <a class="nav-link" href="manageAdmins.jsp">Manage Admins</a>
      <a class="nav-link" href="../logout.jsp">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-5">
  <div class="row">
    <div class="col-md-4 mb-4">
      <div class="card dashboard-card text-white bg-primary h-100">
        <div class="card-body text-center">
          <h5 class="card-title">Total Admins</h5>
          <h2 class="card-text">${adminCount}</h2>
          <a href="manageAdmins.jsp" class="btn btn-light">View All</a>
        </div>
      </div>
    </div>
    <!-- Add more dashboard cards as needed -->
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>