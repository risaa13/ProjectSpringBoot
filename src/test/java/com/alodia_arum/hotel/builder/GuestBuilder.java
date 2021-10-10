package com.alodia_arum.hotel.builder;

import com.alodia_arum.hotel.model.Guest;
import com.alodia_arum.hotel.model.GuestRole;
import org.springframework.test.util.ReflectionTestUtils;

public class GuestBuilder {

    private Guest model;

    public GuestBuilder() {
        model = new Guest();
    }

    public GuestBuilder id(Long id) {
        ReflectionTestUtils.setField(model, "id", id);
        return this;
    }

    public GuestBuilder login(String login) {
        model.setLogin(login);
        return this;
    }

    public GuestBuilder password(String password) {
        model.setPassword(password);
        return this;
    }

    public GuestBuilder confirm(String confirm) {
        model.setConfirm(confirm);
        return this;
    }

    public GuestBuilder role(GuestRole role) {
        model.setRole(role);
        return this;
    }

    public GuestBuilder firstName(String firstName) {
        model.setFirstName(firstName);
        return this;
    }

    public GuestBuilder lastName(String lastName) {
        model.setLastName(lastName);
        return this;
    }

    public Guest build() {
        return model;
    }
}
