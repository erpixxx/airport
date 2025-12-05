package dev.erpix.airport.domain.passenger.dto;

import dev.erpix.airport.domain.passenger.Passenger;

import java.time.LocalDate;

public record PassengerSummaryDto(
    int id,
    String firstName,
    String lastName,
    LocalDate dateOfBirth,
    String passportNumber
) {

    public static PassengerSummaryDto fromPassenger(Passenger passenger) {
        return new PassengerSummaryDto(
            passenger.getId(),
            passenger.getFirstName(),
            passenger.getLastName(),
            passenger.getDateOfBirth(),
            passenger.getPassportNumber()
        );
    }

}
