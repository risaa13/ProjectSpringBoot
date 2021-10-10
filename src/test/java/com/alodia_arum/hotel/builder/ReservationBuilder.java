package com.alodia_arum.hotel.builder;

import com.alodia_arum.hotel.model.Room;
import com.alodia_arum.hotel.model.Reservation;
import com.alodia_arum.hotel.model.Guest;
import org.joda.time.DateTime;
import org.springframework.test.util.ReflectionTestUtils;

public class ReservationBuilder {

    private Reservation model;

    public ReservationBuilder() {
        model = new Reservation();
    }

    public ReservationBuilder id(Long id) {
        ReflectionTestUtils.setField(model, "id", id);
        return this;
    }

    public ReservationBuilder guest(Guest guest) {
        model.setGuest(guest);
        return this;
    }

    public ReservationBuilder room(Room room) {
        model.setRoom(room);
        return this;
    }

    public ReservationBuilder from(DateTime from) {
        model.setFrom(from);
        return this;
    }

    public ReservationBuilder to(DateTime to) {
        model.setTo(to);
        return this;
    }

    public ReservationBuilder cancelled(Boolean cancelled) {
        model.setCancelled(cancelled);
        return this;
    }

    public Reservation build() {
        return model;
    }
}
