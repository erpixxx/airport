package dev.erpix.airport.domain.flight.dto;

import dev.erpix.airport.domain.flight.Flight;
import lombok.Builder;
import lombok.Data;

import java.time.OffsetDateTime;

@Data
@Builder
public class FlightSegmentDto {

    private Integer flightId;
    private String flightNumber;
    private String departureCity;
    private String departureCode;
    private OffsetDateTime departureTime;
    private String arrivalCity;
    private String arrivalCode;
    private OffsetDateTime arrivalTime;
    private String airlineName;
    private String airlineCode;
    private String planeModel;

    public static FlightSegmentDto fromFlight(Flight flight) {
        return FlightSegmentDto.builder()
                .flightId(flight.getId())
                .flightNumber(flight.getNumber())
                .departureCity(flight.getDepartureAirport().getCity())
                .departureCode(flight.getDepartureAirport().getCode())
                .departureTime(flight.getDeparture())
                .arrivalCity(flight.getArrivalAirport().getCity())
                .arrivalCode(flight.getArrivalAirport().getCode())
                .arrivalTime(flight.getArrival())
                .airlineName(flight.getAirline().getName())
                .airlineCode(flight.getAirline().getCode())
                .planeModel(flight.getPlane().getModelName())
                .build();
    }
}
