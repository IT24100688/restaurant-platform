
package com.restaurant.model;

import java.util.*;

public class HotelTableManager {
    private Map<String, Map<String, Queue<Table>>> hotelTables = new HashMap<>();

    public void addHotel(String hotelName) {
        Map<String, Queue<Table>> tableTypes = new HashMap<>();
        tableTypes.put("VIP", new LinkedList<>());
        tableTypes.put("Outdoor", new LinkedList<>());
        tableTypes.put("Family", new LinkedList<>());
        hotelTables.put(hotelName, tableTypes);
    }

    public void addTable(String hotelName, String type, int count) {
        Queue<Table> queue = hotelTables.get(hotelName).get(type);
        for (int i = 0; i < count; i++) {
            queue.offer(new Table(type));
        }
    }

    public void removeTable(String hotelName, String type) {
        Queue<Table> queue = hotelTables.get(hotelName).get(type);
        if (!queue.isEmpty()) {
            queue.poll();
        }
    }

    public int getAvailableCount(String hotelName, String type) {
        return hotelTables.get(hotelName).get(type).size();
    }

    public Map<String, Integer> getTableCounts(String hotelName) {
        Map<String, Integer> result = new HashMap<>();
        for (String type : Arrays.asList("VIP", "Outdoor", "Family")) {
            result.put(type, getAvailableCount(hotelName, type));
        }
        return result;
    }
}
