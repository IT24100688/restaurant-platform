
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login Page</title>
</head>
<link rel="Stylesheet" type="text/css" href="../css/styles.css">
<body>
<form class="login-form" action="LoginServlet" method="POST">
    <h2> Login here </h2>
    <label for="fname">Username</label>
    <input type="text" name="username">
    <label for="password">Password</label>
    <input type="password" name="password">
    <button type="submit">Login</button>
    <div style="text-align: center; margin-top: 20px;">
        <p>Not a member? <a href="Signup.jsp" style="color: #007BFF; text-decoration: none;">Sign Up</a></p>
    </div>
</form>

</body>
</html>
