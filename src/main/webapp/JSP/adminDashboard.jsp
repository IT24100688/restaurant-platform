<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | ReservEats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            min-height: 100vh;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background: var(--primary-light);
            color: white;
            border-radius: 10px 10px 0 0 !important;
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

        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }

        .table thead {
            background: var(--primary-light);
            color: white;
        }

        .badge-reserved {
            background-color: #28a745;
        }

        .badge-available {
            background-color: #17a2b8;
        }

        .badge-blocked {
            background-color: #dc3545;
        }

        .search-box {
            position: relative;
            margin-bottom: 20px;
        }

        .search-box input {
            padding-left: 40px;
            border-radius: 30px;
            border: 1px solid #ddd;
        }

        .search-box i {
            position: absolute;
            left: 15px;
            top: 12px;
            color: #777;
        }

        .stats-card {
            text-align: center;
            padding: 20px;
        }

        .stats-card i {
            font-size: 2.5rem;
            color: var(--accent-color);
            margin-bottom: 15px;
        }

        .stats-card h3 {
            font-size: 1.8rem;
            margin-bottom: 5px;
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
        <li><a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="#restaurants"><i class="fas fa-store"></i> Manage Restaurants</a></li>
        <li><a href="#tables"><i class="fas fa-chair"></i> Table Availability</a></li>
        <li><a href="#reservations"><i class="fas fa-calendar-check"></i> Reservations</a></li>
        <li><a href="#reports"><i class="fas fa-chart-bar"></i> Reports</a></li>
        <li><a href="#settings"><i class="fas fa-cog"></i> Settings</a></li>
        <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="container-fluid">
        <h2 class="mb-4">Admin Dashboard</h2>

        <!-- Stats Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card stats-card">
                    <i class="fas fa-store"></i>
                    <h3>24</h3>
                    <p>Restaurants</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card">
                    <i class="fas fa-chair"></i>
                    <h3>156</h3>
                    <p>Total Tables</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card">
                    <i class="fas fa-calendar-check"></i>
                    <h3>89</h3>
                    <p>Today's Reservations</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card">
                    <i class="fas fa-users"></i>
                    <h3>42</h3>
                    <p>Pending Requests</p>
                </div>
            </div>
        </div>

        <!-- Manage Restaurants Section -->
        <div class="card" id="restaurants">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-store me-2"></i>Manage Restaurants</h4>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" class="form-control" placeholder="Search restaurants...">
                    </div>
                    <button class="btn btn-danger-custom" data-bs-toggle="modal" data-bs-target="#addRestaurantModal">
                        <i class="fas fa-plus me-2"></i>Add Restaurant
                    </button>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Location</th>
                            <th>Cuisine</th>
                            <th>Tables</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>R001</td>
                            <td>Ocean View</td>
                            <td>Colombo</td>
                            <td>Seafood</td>
                            <td>12</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>
                                <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>R002</td>
                            <td>Urban Bistro</td>
                            <td>Kandy</td>
                            <td>International</td>
                            <td>8</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>
                                <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <!-- More restaurants would be listed here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Table Availability Section -->
        <div class="card" id="tables">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-chair me-2"></i>Table Availability</h4>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-4">
                        <select class="form-select" id="restaurantSelect">
                            <option selected>Select Restaurant</option>
                            <option>Ocean View</option>
                            <option>Urban Bistro</option>
                            <option>Mountain Grill</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <input type="date" class="form-control" id="availabilityDate">
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-danger-custom w-100">Filter</button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Table No.</th>
                            <th>Capacity</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>T01</td>
                            <td>4</td>
                            <td><span class="badge badge-available">Available</span></td>
                            <td>
                                <button class="btn btn-sm btn-warning">Block</button>
                            </td>
                        </tr>
                        <tr>
                            <td>T02</td>
                            <td>2</td>
                            <td><span class="badge badge-reserved">Reserved</span></td>
                            <td>
                                <button class="btn btn-sm btn-info">Details</button>
                            </td>
                        </tr>
                        <tr>
                            <td>T03</td>
                            <td>6</td>
                            <td><span class="badge badge-blocked">Blocked</span></td>
                            <td>
                                <button class="btn btn-sm btn-success">Unblock</button>
                            </td>
                        </tr>
                        <!-- More tables would be listed here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Reservations Section -->
        <div class="card" id="reservations">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-calendar-check me-2"></i>View & Manage Reservations</h4>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-3">
                        <select class="form-select" id="reservationStatus">
                            <option selected>All Status</option>
                            <option>Confirmed</option>
                            <option>Pending</option>
                            <option>Cancelled</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="date" class="form-control" id="reservationDate">
                    </div>
                    <div class="col-md-4">
                        <div class="search-box">
                            <i class="fas fa-search"></i>
                            <input type="text" class="form-control" placeholder="Search by customer...">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-danger-custom w-100">Filter</button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Reservation ID</th>
                            <th>Customer</th>
                            <th>Restaurant</th>
                            <th>Date & Time</th>
                            <th>Table</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>RES-1001</td>
                            <td>John Smith</td>
                            <td>Ocean View</td>
                            <td>2023-11-15 19:30</td>
                            <td>T05 (4 seats)</td>
                            <td><span class="badge bg-success">Confirmed</span></td>
                            <td>
                                <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-times"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>RES-1002</td>
                            <td>Sarah Johnson</td>
                            <td>Urban Bistro</td>
                            <td>2023-11-16 20:00</td>
                            <td>T02 (2 seats)</td>
                            <td><span class="badge bg-warning text-dark">Pending</span></td>
                            <td>
                                <button class="btn btn-sm btn-success"><i class="fas fa-check"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-times"></i></button>
                            </td>
                        </tr>
                        <!-- More reservations would be listed here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Restaurant Modal -->
<div class="modal fade" id="addRestaurantModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Restaurant</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Restaurant Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Location</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Cuisine Type</label>
                        <select class="form-select" required>
                            <option value="">Select Cuisine</option>
                            <option>Italian</option>
                            <option>Chinese</option>
                            <option>Indian</option>
                            <option>International</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Number of Tables</label>
                        <input type="number" class="form-control" min="1" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger-custom">Save Restaurant</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Simple script to handle table blocking/unblocking
    document.querySelectorAll('.btn-warning').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            const statusBadge = row.querySelector('.badge');
            statusBadge.className = 'badge badge-blocked';
            statusBadge.textContent = 'Blocked';
            this.className = 'btn btn-sm btn-success';
            this.textContent = 'Unblock';

            this.addEventListener('click', function() {
                statusBadge.className = 'badge badge-available';
                statusBadge.textContent = 'Available';
                this.className = 'btn btn-sm btn-warning';
                this.textContent = 'Block';
            });
        });
    });
</script>
</body>
</html>