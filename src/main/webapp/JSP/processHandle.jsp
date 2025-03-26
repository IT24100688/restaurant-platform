<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String guests = request.getParameter("guests");

    // Process or save the data (e.g., store in a database)
%>
<h2>Reservation Details</h2>
<p>Name: <%= name %></p>
<p>Email: <%= email %></p>
<p>Phone: <%= phone %></p>
<p>Date: <%= date %></p>
<p>Time: <%= time %></p>
<p>Guests: <%= guests %></p>

</body>
</html>
