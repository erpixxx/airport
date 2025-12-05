package dev.erpix.airport.domain.flight.dto;

public record FlightSummaryDto(
        int id,
        String flightNumber,
        String airlineName,
        String airlineCode,
        String planeName,
        String planeCode,
        String departureAirportName
) {
}
