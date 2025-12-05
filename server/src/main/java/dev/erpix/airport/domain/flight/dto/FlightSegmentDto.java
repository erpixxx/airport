package dev.erpix.airport.domain.flight.dto;

import dev.erpix.airport.domain.airline.dto.AirlineSummaryDto;
import dev.erpix.airport.domain.airport.dto.AirportSummaryDto;
import dev.erpix.airport.domain.flight.Flight;
import dev.erpix.airport.domain.plane.dto.PlaneSummaryDto;

public record FlightSegmentDto(
        int id,
        AirlineSummaryDto airline,
        AirportSummaryDto arrivalAirport,
        String arrivalTime,
        AirportSummaryDto departureAirport,
        String departureTime,
        String flightNumber,
        PlaneSummaryDto plane
) {

    public static FlightSegmentDto fromFlight(Flight flight) {
        return new FlightSegmentDto(
                flight.getId(),
                AirlineSummaryDto.fromAirline(flight.getAirline()),
                AirportSummaryDto.fromAirport(flight.getArrivalAirport()),
                flight.getArrival().toString(),
                AirportSummaryDto.fromAirport(flight.getDepartureAirport()),
                flight.getDeparture().toString(),
                flight.getNumber(),
                PlaneSummaryDto.fromPlane(flight.getPlane())
        );
    }

}
