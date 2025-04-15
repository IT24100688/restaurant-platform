package com.restaurant.model;

public class Reservation {
    private String reservationId;
    private String HotelName;
    private String date;
    private String time;
    private int guests;
    private String name;
    private String email;
    private String phone;

    public Reservation(String reservationId, String HotelName, String date, String time,
                       int guests, String name, String email, String phone) {
        this.reservationId = reservationId;
        this.HotelName = HotelName;
        this.date = date;
        this.time = time;
        this.guests = guests;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    public Reservation(String restaurant, String date, String time, int guests, String name, String email) {
    }

    public String getReservationId() {
        return reservationId;
    }

    public String getHotelName() {
        return HotelName;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public int getGuests() {
        return guests;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String toFileString() {
        return reservationId + "," + HotelName + "," + date + "," + time + "," + guests + "," + name + "," + email + "," + phone;
    }
}
