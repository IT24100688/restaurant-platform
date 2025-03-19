<%--
  Created by IntelliJ IDEA.
  User: Ranuda Perera
  Date: 3/19/2025
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="AdminServelet" method="POST">
    <input type="text" name="username" placeholder="Admin Username" required>
    <input type="password" name="password" placeholder="Admin Password" required>
    <button type="submit">Login as Admin</button>
</form>
</body>
</html>
