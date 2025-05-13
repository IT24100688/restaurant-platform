package com.restaurant.service;

import com.restaurant.model.Reservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class MergeSort {

    public static void sort(List<Reservation> list) {
        if (list == null || list.size() <= 1) {
            return; // Already sorted or empty
        }
        sort(list, 0, list.size() - 1);
    }

    private static void sort(List<Reservation> list, int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2; // Avoid potential overflow

            sort(list, left, mid);
            sort(list, mid + 1, right);
            merge(list, left, mid, right);
        }
    }

    private static void merge(List<Reservation> list, int left, int mid, int right) {
        // Create temporary lists
        List<Reservation> leftList = new ArrayList<>(list.subList(left, mid + 1));
        List<Reservation> rightList = new ArrayList<>(list.subList(mid + 1, right + 1));

        int i = 0, j = 0, k = left;

        // Merge the two lists in sorted order
        while (i < leftList.size() && j < rightList.size()) {
            Reservation a = leftList.get(i);
            Reservation b = rightList.get(j);

            if (compareByProximity(a, b) <= 0) {
                list.set(k++, a);
                i++;
            } else {
                list.set(k++, b);
                j++;
            }
        }

        // Copy remaining elements from leftList (if any)
        while (i < leftList.size()) {
            list.set(k++, leftList.get(i++));
        }

        // Copy remaining elements from rightList (if any)
        while (j < rightList.size()) {
            list.set(k++, rightList.get(j++));
        }
    }

    // Compare reservations by proximity to current date
    private static int compareByProximity(Reservation r1, Reservation r2) {
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date today = new Date(); // Current date

            // Handle potential null values
            if (r1.getDate() == null) {
                return (r2.getDate() == null) ? 0 : 1; // Null dates go to the end
            }
            if (r2.getDate() == null) {
                return -1;
            }

            Date d1 = df.parse(r1.getDate());
            Date d2 = df.parse(r2.getDate());

            // Check if dates are in the future or past
            boolean d1IsFuture = d1.compareTo(today) >= 0;
            boolean d2IsFuture = d2.compareTo(today) >= 0;

            // If one is future and one is past, prioritize future
            if (d1IsFuture && !d2IsFuture) return -1;
            if (!d1IsFuture && d2IsFuture) return 1;

            // If both are in the future, sort by proximity to today
            if (d1IsFuture && d2IsFuture) {
                long diff1 = Math.abs(d1.getTime() - today.getTime());
                long diff2 = Math.abs(d2.getTime() - today.getTime());
                return Long.compare(diff1, diff2);
            }

            // If both are in the past, sort by most recent first
            return d2.compareTo(d1);

        } catch (ParseException e) {
            // Log the error
            System.err.println("Error parsing date: " + e.getMessage());

            // Fall back to string comparison if parse fails
            return r1.getDate().compareTo(r2.getDate());
        }
    }

    // Sort by time if on same day
    private static int compareByTime(Reservation r1, Reservation r2) {
        if (r1.getTime() == null) {
            return (r2.getTime() == null) ? 0 : 1;
        }
        if (r2.getTime() == null) {
            return -1;
        }
        return r1.getTime().compareTo(r2.getTime());
    }

    // Sort reservations by date and time chronologically
    public static void sortChronologically(List<Reservation> list) {
        if (list == null || list.size() <= 1) {
            return;
        }

        Collections.sort(list, (r1, r2) -> {
            try {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm a");

                if (r1.getDate() == null || r1.getTime() == null) {
                    return (r2.getDate() == null || r2.getTime() == null) ? 0 : 1;
                }
                if (r2.getDate() == null || r2.getTime() == null) {
                    return -1;
                }

                Date d1 = df.parse(r1.getDate() + " " + r1.getTime());
                Date d2 = df.parse(r2.getDate() + " " + r2.getTime());

                return d1.compareTo(d2);
            } catch (ParseException e) {
                int dateCompare = r1.getDate().compareTo(r2.getDate());
                return dateCompare != 0 ? dateCompare : r1.getTime().compareTo(r2.getTime());
            }
        });
    }

    // Convenience method to sort in descending order (newest first)
    public static void sortDescending(List<Reservation> list) {
        sortChronologically(list);
        Collections.reverse(list);
    }
}
