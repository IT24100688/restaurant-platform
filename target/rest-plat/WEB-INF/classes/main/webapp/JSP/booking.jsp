<%@ page import="com.restaurant.model.Hotel" %>
<%
    Hotel hotel = (Hotel) request.getAttribute("selectedHotel");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Table</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        :root {
            --linear-grad: linear-gradient(to right, #141E30, #243B55);
            --grad-clr1: #141E30;
            --grad-clr2: #243B55;
            --accent-color: #141E30;
            --accent-hover: #1823dd;
        }

        body {
            height: 100vh;
            background: #f6f5f7;
            display: grid;
            place-content: center;
        }

        .booking-container {
            display: flex;
            width: 850px;
            height: 500px;
            background-color: #FFF;
            box-shadow: 25px 30px 55px #5557;
            border-radius: 13px;
            overflow: hidden;
        }

        .restaurant-info {
            width: 50%;
            padding: 40px;
            background: var(--linear-grad);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .restaurant-info h1 {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .restaurant-info p {
            font-size: 14px;
            margin-bottom: 10px;
            line-height: 1.6;
        }

        .restaurant-info ul {
            list-style: none;
            padding: 0;
        }

        .restaurant-info li {
            font-size: 13px;
            margin-bottom: 5px;
        }

        .booking-form {
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .booking-form h2 {
            color: var(--grad-clr1);
            margin-bottom: 25px;
            font-size: 22px;
            text-align: center;
        }

        .form-group {
            position: relative;
            margin-bottom: 20px;
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 12px 15px;
            background-color: #f3f3f3;
            border: none;
            outline: none;
            border-radius: 5px;
        }

        .underline {
            position: absolute;
            left: 50%;
            top: 100%;
            transform: translateX(-50%);
            width: 0%;
            height: 2px;
            background: var(--linear-grad);
            transition: 0.3s;
        }

        input:focus ~ .underline, select:focus ~ .underline {
            width: 100%;
        }

        .time-slots {
            display: flex;
            gap: 10px;
            margin: 15px 0 25px;
        }

        .time-slot {
            flex: 1;
            background: var(--accent-color);
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .time-slot:hover, .time-slot.active {
            background: var(--accent-hover);
        }

        .proceed-btn {
            width: 100%;
            background: var(--accent-color);
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .proceed-btn:hover {
            background: var(--accent-hover);
        }
    </style>
</head>
<body>
<form action=JSP/table.jsp METHOD="get">
    <input type="hidden" name="hotelName" value="<%= hotel != null ? hotel.getName() : "" %>">
    <input type="hidden" name="selectedTime" id="selectedTimeInput">
    <input type="hidden" name="selectedGuests" id="selectedGuestsInput">
    <input type="hidden" name="selectedDate" id="selectedDateInput">


    <div class="booking-container">
        <!-- Left Side: Dynamic Hotel Info -->
        <div class="restaurant-info">
            <h1><%= hotel != null ? hotel.getName() : "Hotel Name" %></h1>
            <p><%= hotel != null ? hotel.getDescription()
                    : "Hotel description not found." %></p>
            <% if (hotel != null) { %>
            <ul style="padding-left: 20px;">
                <% for (String f : hotel.getFeatures()) { %>
                <li style="margin-bottom: 5px;">✅ <%= f %></li>
                <% } %>
            </ul>
            <% } %>
        </div>

        <!-- Right Side: Booking Form -->
        <div class="booking-form">
            <h2>Make a Reservation</h2>

            <div class="form-group">
                <label for="guests">Number of People</label>
                <select id="guests">
                    <option value="1">1 Person</option>
                    <option value="2">2 People</option>
                    <option value="3">3 People</option>
                    <option value="4">4 People</option>
                    <option value="5">5 People</option>
                    <option value="6">6 People</option>
                    <option value="7">7 People</option>
                    <option value="8">8 People</option>
                    <option value="9">9 People</option>
                    <option value="10">10 People</option>
                </select>
                <span class="underline"></span>
            </div>

            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date">
                <span class="underline"></span>
            </div>

            <label>Select a time</label>
            <div class="time-slots">
                <button type="button" class="time-slot">8:30 PM</button>
                <button type="button" class="time-slot">8:45 PM</button>
                <button type="button" class="time-slot">9:00 PM</button>
            </div>

            <button type="submit" class="proceed-btn">Proceed</button>
        </div>
    </div>
</form>

<script>
    const guestSelect = document.getElementById('guests');
    const dateInput = document.getElementById('date');
    const timeButtons = document.querySelectorAll('.time-slot');
    const timeInput = document.getElementById('selectedTimeInput');
    const guestsInput = document.getElementById('selectedGuestsInput');
    const dateHiddenInput = document.getElementById('selectedDateInput');

    document.querySelector('form').addEventListener('submit', function(event) {
        const selectedTime = document.querySelector('.time-slot.active');
        if (!selectedTime) {
            alert("Please select a time slot!");
            event.preventDefault();
            return;
        }

        timeInput.value = selectedTime.textContent.trim();
        guestsInput.value = guestSelect.value;
        dateHiddenInput.value = dateInput.value;
    });

    timeButtons.forEach(button => {
        button.addEventListener('click', function() {
            timeButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
        });
    });
</script>
</body>
</html>
