package com.restaurant.service;

import com.restaurant.model.Reservation;

import java.text.SimpleDateFormat;
import java.util.*;

public class MergeSort {

    public static void sort(List<Reservation> list, int left, int right) {
        if (left < right) {
            int mid = (left + right) / 2;

            sort(list, left, mid);
            sort(list, mid + 1, right);
            merge(list, left, mid, right);
        }
    }

    private static void merge(List<Reservation> list, int left, int mid, int right) {
        List<Reservation> leftList = new ArrayList<>(list.subList(left, mid + 1));
        List<Reservation> rightList = new ArrayList<>(list.subList(mid + 1, right + 1));

        int i = 0, j = 0, k = left;

        while (i < leftList.size() && j < rightList.size()) {
            Reservation a = leftList.get(i);
            Reservation b = rightList.get(j);

            if (compareByDateTime(a, b) <= 0) {
                list.set(k++, a);
                i++;
            } else {
                list.set(k++, b);
                j++;
            }
        }

        while (i < leftList.size()) list.set(k++, leftList.get(i++));
        while (j < rightList.size()) list.set(k++, rightList.get(j++));
    }

    // Compare by date and time
    private static int compareByDateTime(Reservation r1, Reservation r2) {
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
            Date d1 = df.parse(r1.getDate() + " " + r1.getTime());
            Date d2 = df.parse(r2.getDate() + " " + r2.getTime());
            return d1.compareTo(d2);
        } catch (Exception e) {
            return 0; // fallback to equal if parse fails
        }
    }
}
