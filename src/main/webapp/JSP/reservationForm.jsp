<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String tableType = request.getParameter("tableType");
    session.setAttribute("tableType", tableType); // Store in session
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4a6fa5;
            --primary-dark: #3a5a8a;
            --secondary: #f8f9fa;
            --text: #2d3748;
            --text-light: #718096;
            --border: #e2e8f0;
            --success: #48bb78;
            --error: #f56565;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6f5f7 0%, #e9e9e9 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 900px;
            display: flex;
            overflow: hidden;
            min-height: 500px;
        }

        .details-section {
            flex: 1;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section {
            flex: 1;
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h1 {
            color: white;
            margin-bottom: 2rem;
            font-weight: 600;
            position: relative;
            padding-bottom: 1rem;
            text-align: left;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 80px;
            height: 3px;
            background: white;
            border-radius: 3px;
        }

        .form-title {
            color: var(--primary);
            text-align: left;
        }

        .form-title::after {
            background: linear-gradient(90deg, var(--primary) 0%, var(--primary-dark) 100%);
        }

        .reservation-details {
            margin-top: 1rem;
        }

        .detail-item {
            display: flex;
            margin-bottom: 1.5rem;
            align-items: center;
        }

        .detail-icon {
            font-size: 1.2rem;
            margin-right: 1rem;
            width: 24px;
            text-align: center;
        }

        .detail-content {
            flex: 1;
        }

        .detail-label {
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 0.25rem;
        }

        .detail-value {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text);
        }

        .input-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: var(--text-light);
        }

        input, textarea {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border-radius: 8px;
            border: 1px solid var(--border);
            font-family: 'Poppins', sans-serif;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        textarea {
            padding-left: 15px;
            min-height: 100px;
            resize: vertical;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.2);
        }

        button {
            width: 100%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 1rem;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 111, 165, 0.3);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                min-height: auto;
            }

            .details-section, .form-section {
                padding: 1.5rem;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="details-section">
        <h1><i class="fas fa-calendar-alt"></i> Reservation Summary</h1>

        <div class="reservation-details">
            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-hotel"></i>
                </div>
                <div class="detail-content">
                    <div class="detail-label">Hotel</div>
                    <div class="detail-value"><%= request.getParameter("hotelName") %></div>
                </div>
            </div>

            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-calendar-day"></i>
                </div>
                <div class="detail-content">
                    <div class="detail-label">Date</div>
                    <div class="detail-value"><%= request.getParameter("selectedDate") %></div>
                </div>
            </div>

            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="detail-content">
                    <div class="detail-label">Time</div>
                    <div class="detail-value"><%= request.getParameter("selectedTime") %></div>
                </div>
            </div>

            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-user-friends"></i>
                </div>
                <div class="detail-content">
                    <div class="detail-label">Guests</div>
                    <div class="detail-value"><%= request.getParameter("selectedGuests") %></div>
                </div>
            </div>

            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-chair"></i>
                </div>
                <div class="detail-content">
                    <div class="detail-label">Table Type</div>
                    <div class="detail-value"><%= tableType %></div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-section">
        <h1 class="form-title"><i class="fas fa-user-edit"></i> Customer Details</h1>

        <form action="<%= request.getContextPath() %>/ReservationServlet" method="post">
            <input type="hidden" name="selectedTime" value="<%= request.getParameter("selectedTime") %>">
            <input type="hidden" name="selectedDate" value="<%= request.getParameter("selectedDate") %>">
            <input type="hidden" name="selectedGuests" value="<%= request.getParameter("selectedGuests") %>">
            <input type="hidden" name="hotelName" value="<%= request.getParameter("hotelName") %>">
            <input type="hidden" name="tableType" value="<%= tableType %>">

            <div class="form-group">
                <label for="name">Full Name</label>
                <div class="input-icon">
                    <i class="fas fa-user"></i>
                </div>
                <input type="text" id="name" name="name" placeholder="John Doe" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <input type="email" id="email" name="email" placeholder="john@example.com" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <div class="input-icon">
                    <i class="fas fa-phone"></i>
                </div>
                <input type="tel" id="phone" name="phone" placeholder="+1 (123) 456-7890" required>
            </div>

            <div class="form-group">
                <label for="requests">Special Requests (Optional)</label>
                <textarea id="requests" name="requests" placeholder="Any special requirements or preferences..."></textarea>
            </div>

            <button type="submit">
                <i class="fas fa-check-circle"></i> Confirm Reservation
            </button>
        </form>
    </div>
</div>
</body>
</html>