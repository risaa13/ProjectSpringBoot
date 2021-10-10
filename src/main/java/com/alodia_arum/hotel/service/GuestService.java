package com.alodia_arum.hotel.service;

import com.alodia_arum.hotel.model.Guest;

public interface GuestService {
    /* Basic CRUD operations */
    Guest findByLogin(String login);
    Guest save(Guest guest);
    void delete(Long id);
}
