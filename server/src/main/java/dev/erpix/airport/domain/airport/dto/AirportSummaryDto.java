package dev.erpix.airport.domain.airport.dto;

import dev.erpix.airport.domain.airport.Airport;

public record AirportSummaryDto(
        String code,
        String name,
        String city,
        String country
) {

    public static AirportSummaryDto fromAirport(Airport airport) {
        return new AirportSummaryDto(
                airport.getCode(),
                airport.getName(),
                airport.getCity(),
                airport.getCountry()
        );
    }

}
