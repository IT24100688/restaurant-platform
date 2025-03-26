package com.restaurant.service;
import com.restaurant.model.Reservation;
import java.util.List;
public class MergeSort {
        public static void sort(List<Reservation> reservations, int left, int right) {
            if (left < right) {
                int mid = left + (right - left) / 2;
                sort(reservations, left, mid);
                sort(reservations, mid + 1, right);
                merge(reservations, left, mid, right);
            }
        }

        private static void merge(List<Reservation> reservations, int left, int mid, int right) {
            List<Reservation> leftList = reservations.subList(left, mid + 1);
            List<Reservation> rightList = reservations.subList(mid + 1, right + 1);

            int i = 0, j = 0, k = left;
            while (i < leftList.size() && j < rightList.size()) {
                if (leftList.get(i).getReservationTime().compareTo(rightList.get(j).getReservationTime()) <= 0) {
                    reservations.set(k++, leftList.get(i++));
                } else {
                    reservations.set(k++, rightList.get(j++));
                }
            }

            while (i < leftList.size()) {
                reservations.set(k++, leftList.get(i++));
            }

            while (j < rightList.size()) {
                reservations.set(k++, rightList.get(j++));
            }
        }
    }


