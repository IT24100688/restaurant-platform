<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Reservation Error</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      background: linear-gradient(to right, #141E30, #243B55);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #333;
    }

    .error-container {
      background: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
      text-align: center;
      max-width: 500px;
      width: 90%;
    }

    .error-icon {
      font-size: 60px;
      color: crimson;
      margin-bottom: 20px;
    }

    h1 {
      color: #141E30;
      margin-bottom: 20px;
    }

    .error-message {
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
      padding: 15px;
      border-radius: 5px;
      margin: 20px 0;
      text-align: left;
    }

    .btn {
      margin-top: 20px;
      padding: 12px 25px;
      background-color: #141E30;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #1823dd;
    }

    .error-details {
      margin-top: 20px;
      font-size: 14px;
      color: #666;
      text-align: left;
    }

    .error-code {
      display: inline-block;
      background: #eee;
      padding: 3px 8px;
      border-radius: 3px;
      font-family: monospace;
    }
  </style>
</head>
<body>

<div class="error-container">
  <div class="error-icon">&#9888;</div>
  <h1>Reservation Error</h1>



  <a href="user-dashboard" class="btn">Return to Dashboard</a>
</div>

</body>
</html>
