package dev.erpix.airport.domain.passenger.dto;

import java.time.LocalDate;

public record PassengerUpdateRequestDto(
        int id,
        String firstName,
        String lastName,
        LocalDate dateOfBirth,
        String passportNumber
) { }
