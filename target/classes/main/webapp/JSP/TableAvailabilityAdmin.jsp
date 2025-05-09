
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%
  // Simulated backend Queues for demo purposes
  Map<String, Queue<String>> outdoorTables = new HashMap<>();
  Map<String, Queue<String>> vipTables = new HashMap<>();
  Map<String, Queue<String>> familyTables = new HashMap<>();

  List<String> hotels = Arrays.asList("Tropical Paradise", "City View Suites", "Mountain Lodge");
  for (String hotel : hotels) {
    outdoorTables.put(hotel, new LinkedList<>(Arrays.asList("T1", "T2")));
    vipTables.put(hotel, new LinkedList<>(Arrays.asList("V1")));
    familyTables.put(hotel, new LinkedList<>(Arrays.asList("F1", "F2", "F3")));
  }
%>

<html>
<head>
  <title>Table Availability - Admin Dashboard</title>
  <link rel="stylesheet" href="style.css">
  <style>
    .dashboard-container { padding: 20px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 12px; border: 1px solid #ccc; text-align: center; }
    button { padding: 6px 12px; }
    .modal { display: none; position: fixed; top: 20%; left: 30%; background: #fff; padding: 20px; border: 1px solid #ccc; }
    .modal input { width: 40px; margin: 0 5px; }
  </style>
</head>
<body>

<div class="dashboard-container">
  <h2>Table Availability</h2>
  <table>
    <tr>
      <th>Hotel Name</th>
      <th>Outdoor</th>
      <th>VIP</th>
      <th>Family</th>
      <th>Action</th>
    </tr>
    <% for (String hotel : hotels) { %>
    <tr>
      <td><%= hotel %></td>
      <td><%= outdoorTables.get(hotel).size() %></td>
      <td><%= vipTables.get(hotel).size() %></td>
      <td><%= familyTables.get(hotel).size() %></td>
      <td>
        <button onclick="openModal('<%= hotel %>')">Manage Tables</button>
      </td>
    </tr>
    <% } %>
  </table>
</div>

<!-- Modal -->
<div id="tableModal" class="modal">
  <h3 id="modalTitle">Manage Tables</h3>
  <form method="post" action="TableManagerServlet">
    <input type="hidden" id="hotelInput" name="hotelName">
    <div>
      Outdoor:
      <label>Add <input name="addOutdoor" type="number" min="0"></label>
      <label>Remove <input name="removeOutdoor" type="number" min="0"></label>
    </div>
    <div>
      VIP:
      <label>Add <input name="addVip" type="number" min="0"></label>
      <label>Remove <input name="removeVip" type="number" min="0"></label>
    </div>
    <div>
      Family:
      <label>Add <input name="addFamily" type="number" min="0"></label>
      <label>Remove <input name="removeFamily" type="number" min="0"></label>
    </div>
    <br>
    <button type="submit">Update</button>
    <button type="button" onclick="closeModal()">Cancel</button>
  </form>
</div>

<script>
  function openModal(hotelName) {
    document.getElementById("hotelInput").value = hotelName;
    document.getElementById("modalTitle").innerText = "Manage Tables for " + hotelName;
    document.getElementById("tableModal").style.display = "block";
  }

  function closeModal() {
    document.getElementById("tableModal").style.display = "none";
  }
</script>

</body>
</html>
