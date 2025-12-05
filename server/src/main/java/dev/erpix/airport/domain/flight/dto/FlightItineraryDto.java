package dev.erpix.airport.domain.flight.dto;

import dev.erpix.airport.domain.flight.Flight;

import java.util.ArrayList;
import java.util.List;

public record FlightItineraryDto(
        List<FlightSegmentDto> segments,
        int stops
) {

    public static FlightItineraryDto fromFlight(Flight startFlight) {
        return fromFlight(startFlight, null);
    }

    public static FlightItineraryDto fromFlight(Flight startFlight, String targetCode) {
        List<FlightSegmentDto> segments = new ArrayList<>();
        Flight current = startFlight;

        while (current != null) {
            segments.add(FlightSegmentDto.fromFlight(current));

            if (current.getArrivalAirport().getCode().equals(targetCode)) {
                break;
            }

            current = current.getConnectingFlight();
        }

        return new FlightItineraryDto(
                segments,
                Math.max(0, segments.size() - 1)
        );
    }

}
