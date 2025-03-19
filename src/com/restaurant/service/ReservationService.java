package com.restaurant.service;

import com.restaurant.model.Reservation;
import java.util.ArrayList;
import java.util.List;

    public class ReservationService {
        private static List<Reservation> reservations = new ArrayList<>();

        public static void addReservation(Reservation reservation) {
            reservations.add(reservation);
        }

        public static List<Reservation> getAllReservations() {
            return reservations;
        }
    }

