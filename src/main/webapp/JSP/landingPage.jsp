<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Reservation Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<header>
    <h1>Welcome to Our Restaurant Reservation Platform!</h1>
    <p>Your convenient way to reserve a table at our restaurant.</p>
</header>

<nav>
    <a href="JSP/login.jsp">Login</a> |
    <a href="JSP/Signup.jsp">Sign Up</a> |
    <a href="tables.jsp">Reserve a Table</a>
</nav>

<section>
    <h2>Why Choose Us?</h2>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <ul>
        <li>Real-time table availability</li>
        <li>Fast and secure booking process</li>
        <li>24/7 support for your dining needs</li>
    </ul>
</section>

<%
    String announcement = "Book your table now for our special weekend offers!";
%>
<div class="announcement">
    <p><strong>Announcement:</strong> <%= announcement %></p>
</div>

<footer>
    <p>Contact us at support@restaurant.com | Follow us on social media</p>
</footer>
</body>
</html>