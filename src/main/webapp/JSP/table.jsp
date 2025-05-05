
<%
  String hotelName = request.getParameter("hotelName");
  String selectedDate = request.getParameter("selectedDate");
  String selectedTime = request.getParameter("selectedTime");
  String selectedGuests = request.getParameter("selectedGuests");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Select Your Table | Table Booking</title>
  <style>
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: #f8f8f8;
      margin: 0;
      padding: 0;
    }
    header {
      background: #141E30;
      color: #fff;
      padding: 24px 0;
      text-align: center;
      letter-spacing: 2px;
    }
    .container {
      max-width: 1000px;
      margin: 40px auto;
      padding: 0 20px;
    }
    .table-types {
      display: flex;
      flex-wrap: wrap;
      gap: 32px;
      justify-content: center;
    }
    .table-card {
      background: #fff;
      border-radius: 16px;
      box-shadow: 0 4px 16px rgba(44,62,80,0.08);
      width: 300px;
      padding: 32px 24px 24px 24px;
      text-align: center;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .table-card:hover {
      transform: translateY(-8px) scale(1.03);
      box-shadow: 0 8px 24px rgba(44,62,80,0.16);
    }
    .table-card .icon {
      font-size: 48px;
      margin-bottom: 18px;
    }
    .table-card.vip { border-top: 4px solid #141E30; }
    .table-card.family { border-top: 4px solid #141E30; }
    .table-card.outdoor { border-top: 4px solid #141E30; }
    .table-card h2 {
      margin: 0 0 12px 0;
      font-size: 1.4rem;
      color: #141E30;
      letter-spacing: 1px;
    }
    .table-card p {
      color: #666;
      font-size: 1rem;
      margin-bottom: 22px;
      min-height: 44px;
    }
    .book-btn {
      background: #2d3e50;
      color: #fff;
      border: none;
      padding: 12px 32px;
      border-radius: 6px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.2s;
      letter-spacing: 1px;
    }
    .table-card.vip .book-btn { background: #141E30;  }
    .table-card.family .book-btn { background: #141E30; }
    .table-card.outdoor .book-btn { background: #141E30; }
    .book-btn:hover {
      opacity: 0.88;
    }
    @media (max-width: 900px) {
      .table-types { flex-direction: column; align-items: center; }
      .table-card { width: 90%; }
    }
  </style>
</head>
<body>
<header>
  <h1>Select Your Table</h1>
  <p>Choose the perfect table for your dining experience</p>
</header>
<form action="reservationForm.jsp" method="post">
  <input type="hidden" name="hotelName" value="<%= request.getParameter("hotelName") %>">
  <input type="hidden" name="selectedDate" value="<%= request.getParameter("selectedDate") %>">
  <input type="hidden" name="selectedTime" value="<%= request.getParameter("selectedTime") %>">
  <input type="hidden" name="selectedGuests" value="<%= request.getParameter("selectedGuests") %>">

  <div class="container">
  <div class="table-types">
    <!-- VIP Table -->
    <div class="table-card vip">
      <div class="icon"></div>
      <h2>VIP Table</h2>
      <p>Exclusive seating for special occasions. Enjoy privacy, premium service, and luxury ambiance.</p>
      <button type="submit" name="tableType" value="VIP Table" class="book-btn">Book VIP Table</button>
    </div>
    <!-- Family Table -->
    <div class="table-card family">
      <div class="icon"></div>
      <h2>Family Table</h2>
      <p>Spacious and comfortable tables for families and groups. Perfect for sharing meals together.</p>
      <button type="submit" name="tableType" value="Family Table" class="book-btn">Book Family Table</button>
    </div>
    <!-- Outdoor Table -->
    <div class="table-card outdoor">
      <div class="icon"></div>
      <h2>Outdoor Table</h2>
      <p>Enjoy your meal in the fresh air with our beautifully arranged outdoor seating.</p>
      <button type="submit" name="tableType" value="Outdoor Table" class="book-btn">Book Outdoor Table</button>
    </div>
  </div>
</div>
  </form>
</body>
</html>
