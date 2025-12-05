package dev.erpix.airport.domain.airline.dto;

import dev.erpix.airport.domain.airline.Airline;

public record AirlineSummaryDto(
        String code,
        String name
) {

    public static AirlineSummaryDto fromAirline(Airline airline) {
        return new AirlineSummaryDto(
                airline.getCode(),
                airline.getName()
        );
    }

}
