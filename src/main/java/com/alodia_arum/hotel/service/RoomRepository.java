package com.alodia_arum.hotel.service;

import com.alodia_arum.hotel.model.Room;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

interface RoomRepository extends CrudRepository<Room, Long>, JpaSpecificationExecutor<Room> {
    /* Custom queries with join */
    Room findByNumber(String number);
}
