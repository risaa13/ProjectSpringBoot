package com.alodia_arum.hotel.builder;

import com.alodia_arum.hotel.model.Hotel;
import com.alodia_arum.hotel.model.Room;
import com.alodia_arum.hotel.model.RoomDirection;
import com.alodia_arum.hotel.model.RoomType;
import org.springframework.test.util.ReflectionTestUtils;

public class RoomBuilder {

    private Room model;

    public RoomBuilder() {
        model = new Room();
    }

    public RoomBuilder id(Long id) {
        ReflectionTestUtils.setField(model, "id", id);
        return this;
    }

    public RoomBuilder number(String number) {
        model.setNumber(number);
        return this;
    }

    public RoomBuilder type(RoomType type) {
        model.setType(type);
        return this;
    }

    public RoomBuilder direction(RoomDirection direction) {
        model.setDirection(direction);
        return this;
    }

    public RoomBuilder hotel(Hotel hotel) {
        model.setHotel(hotel);
        return this;
    }

    public Room build() {
        return model;
    }
}
