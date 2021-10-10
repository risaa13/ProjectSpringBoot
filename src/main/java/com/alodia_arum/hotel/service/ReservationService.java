package com.alodia_arum.hotel.service;

import com.alodia_arum.hotel.model.Guest;
import com.alodia_arum.hotel.model.Reservation;
import com.alodia_arum.hotel.model.Room;
import org.joda.time.DateTime;

import java.util.List;

public interface ReservationService {
    /* Basic CRUD operations */
    List<Reservation> findOneByRoomAndDates(Long id, Long roomId, DateTime from, DateTime to);
    List<Reservation> findAllByGuestAndRoom(Guest guest, Room room);
    Reservation findOne(Long id);
    Reservation save(Reservation reservation);
    void delete(Long id);
}
