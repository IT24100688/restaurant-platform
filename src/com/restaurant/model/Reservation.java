package com.restaurant.model;

public class Reservation {

        private String name;
        private String contact;
        private String reservationTime;

        public Reservation(String name, String contact, String reservationTime) {
            this.name = name;
            this.contact = contact;
            this.reservationTime = reservationTime;
        }

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }

        public String getContact() { return contact; }
        public void setContact(String contact) { this.contact = contact; }

        public String getReservationTime() { return reservationTime; }
        public void setReservationTime(String reservationTime) { this.reservationTime = reservationTime; }
    }

