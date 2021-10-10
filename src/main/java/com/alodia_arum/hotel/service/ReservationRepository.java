package com.alodia_arum.hotel.service;

import com.alodia_arum.hotel.model.Guest;
import com.alodia_arum.hotel.model.Reservation;
import com.alodia_arum.hotel.model.Room;
import org.joda.time.DateTime;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

interface ReservationRepository extends CrudRepository<Reservation, Long> {
    /* Custom queries with join */
    List<Reservation> findOneByRoomAndDates(@Param("id") Long id, @Param("rid") Long roomId, @Param("fr") DateTime from, @Param("to") DateTime to);
    List<Reservation> findAllByGuestAndRoom(Guest guest, Room room);
}
