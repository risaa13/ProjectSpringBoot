package com.alodia_arum.hotel.service;

import com.alodia_arum.hotel.model.Room;
import com.alodia_arum.hotel.model.RoomDirection;
import com.alodia_arum.hotel.model.RoomType;

import java.util.List;

public interface RoomService {
    /* Basic CRUD operations */
    List<Room> findAllByCriteria(String number, RoomType type, RoomDirection direction);
    Room findOne(Long id);
    Room findByNumber(String number);
    Room save(Room room);
    void delete(Long id);
}
