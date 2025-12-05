package dev.erpix.airport.domain.passenger.dto;

import java.time.LocalDate;

public record PassengerCreateRequestDto(
        int userId,
        String firstName,
        String lastName,
        LocalDate dateOfBirth,
        String passportNumber
) { }
