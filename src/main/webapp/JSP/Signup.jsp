
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>

<body>

    <form class="signup-form" action="SignupServlet" method="post">
        <h2>Sign Up</h2>
        <label for="first-name">First name</label>
        <input type="text" id="first-name" name="first-name" required>

        <label for="last-name">Last name</label>
        <input type="text" id="last-name" name="last-name" required>

        <label for="phone-number">Phone number</label>
        <input type="text" id="phone-number" name="phone-number" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <label for="confirm-password">Password confirmation</label>
        <input type="password" id="confirm-password" name="confirm-password" required>

        <button type="submit">Sign Up</button>
    </form>

</body>
</html>