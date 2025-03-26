package com.restaurant.service;

import com.restaurant.model.Reservation;


import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class ReservationService {
    private static Queue<Reservation> reservationQueue = new LinkedList<>();

    public static void addReservation(Reservation res) {
        reservationQueue.offer(res);  // Add to queue
        sortReservations();  // Sort using Merge Sort
    }

    public static void sortReservations() {
        ArrayList<Reservation> sortedList = new ArrayList<>(reservationQueue);
        MergeSort.sort(sortedList, 0, sortedList.size() - 1);
        reservationQueue.clear();
        reservationQueue.addAll(sortedList);
    }
}
