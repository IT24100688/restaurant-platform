package com.restaurant.model;

import java.util.*;

public class HotelTableManager {
    private Hotel[] hotels = new Hotel[100];
    private int hotelCount = 0;

    public void addHotel(Hotel hotel) {
        if (findHotel(hotel.getName()) != null) return;
        hotels[hotelCount++] = hotel;
    }

    public String[] getAllHotelNames() {
        String[] names = new String[hotelCount];
        for (int i = 0; i < hotelCount; i++) {
            names[i] = hotels[i].getName();
        }
        return names;
    }

    public void addTable(String hotelName, String type, int count) {
        Hotel hotel = findHotel(hotelName);
        if (hotel == null) return;
        MyQueue<Table> queue = hotel.getQueueByType(type);
        if (queue == null) return;
        for (int i = 0; i < count; i++) {
            queue.offer(new Table(type));
        }
    }

    public void removeTable(String hotelName, String type) {
        Hotel hotel = findHotel(hotelName);
        if (hotel == null) return;
        MyQueue<Table> queue = hotel.getQueueByType(type);
        if (queue == null || queue.isEmpty()) return;
        queue.poll();
    }

    public int getAvailableCount(String hotelName, String type) {
        Hotel hotel = findHotel(hotelName);
        if (hotel == null) return 0;
        MyQueue<Table> queue = hotel.getQueueByType(type);
        return queue != null ? queue.size() : 0;
    }

    public int[] getTableCounts(String hotelName) {
        Hotel hotel = findHotel(hotelName);
        if (hotel == null) return new int[]{0, 0, 0};
        return new int[]{
                hotel.getQueueByType("VIP").size(),
                hotel.getQueueByType("Outdoor").size(),
                hotel.getQueueByType("Family").size()
        };
    }

    public void removeHotel(String hotelName) {
        for (int i = 0; i < hotelCount; i++) {
            if (hotels[i].getName().equals(hotelName)) {
                for (int j = i; j < hotelCount - 1; j++) {
                    hotels[j] = hotels[j + 1];
                }
                hotels[--hotelCount] = null;
                break;
            }
        }
    }

    private Hotel findHotel(String name) {
        for (int i = 0; i < hotelCount; i++) {
            if (hotels[i].getName().equals(name)) {
                return hotels[i];
            }
        }
        return null;
    }
}

