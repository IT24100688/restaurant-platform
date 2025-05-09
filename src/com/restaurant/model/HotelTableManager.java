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
    public void loadHotelDataLine(String line) {
        String[] parts = line.split("\\|");
        if (parts.length != 4) return;

        String hotelName = parts[0];
        addHotel(hotelName);

        for (int i = 1; i < parts.length; i++) {
            String[] pair = parts[i].split(":");
            if (pair.length == 2) {
                String type = pair[0];
                int count = Integer.parseInt(pair[1]);
                addTable(hotelName, type, count);
            }
        }
    }


    public Set<String> getAllHotelNames() {
        return hotelTables.keySet();
    }

    public void addTable(String hotelName, String type, int count) {
        if (!hotelTables.containsKey(hotelName)) return;
        Queue<Table> queue = hotelTables.get(hotelName).get(type);
        if (queue == null) return;
        for (int i = 0; i < count; i++) {
            queue.offer(new Table(type));
        }
    }

    public void removeTable(String hotelName, String type) {
        if (!hotelTables.containsKey(hotelName)) return;
        Queue<Table> queue = hotelTables.get(hotelName).get(type);
        if (queue == null || queue.isEmpty()) return;
        queue.poll();
    }

    public int getAvailableCount(String hotelName, String type) {
        if (!hotelTables.containsKey(hotelName)) return 0;
        Queue<Table> queue = hotelTables.get(hotelName).get(type);
        return queue != null ? queue.size() : 0;
    }

    public Map<String, Integer> getTableCounts(String hotelName) {
        Map<String, Integer> result = new HashMap<>();
        if (!hotelTables.containsKey(hotelName)) return result;
        for (String type : Arrays.asList("VIP", "Outdoor", "Family")) {
            result.put(type, getAvailableCount(hotelName, type));
        }
        return result;
    }

    // ✅ New method to convert hotel data to a line for saving to file
    public String getHotelDataLine(String hotelName) {
        Map<String, Integer> counts = getTableCounts(hotelName);
        return hotelName + "|VIP:" + counts.get("VIP") +
                "|Family:" + counts.get("Family") +
                "|Outdoor:" + counts.get("Outdoor");
    }
}