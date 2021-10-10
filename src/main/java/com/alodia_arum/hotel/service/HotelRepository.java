package com.alodia_arum.hotel.service;

import com.alodia_arum.hotel.model.Hotel;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

interface HotelRepository extends CrudRepository<Hotel, Long>, JpaSpecificationExecutor<Hotel> {
    /* Custom query with join */
    Hotel findByName(String name);
}
