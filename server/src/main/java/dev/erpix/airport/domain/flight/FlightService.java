package dev.erpix.airport.domain.flight;

import dev.erpix.airport.domain.flight.dto.FlightItineraryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;

@Service
@RequiredArgsConstructor
public class FlightService {

    private final FlightRepository flightRepository;

    public Page<FlightItineraryDto> getFlightsFromTo(String fromCode, String toCode, Pageable pageable) {
        OffsetDateTime now = OffsetDateTime.now();
        Page<Flight> flightsPage = flightRepository.findFlightsFromTo(fromCode, toCode, now, pageable);

        return flightsPage.map(flight -> FlightItineraryDto.fromFlight(flight, toCode));
    }

    public Page<FlightItineraryDto> getUpcomingFlights(String from, Pageable pageable) {
        OffsetDateTime now = OffsetDateTime.now();
        Page<Flight> flightsPage = flightRepository.findUpcomingFlights(from, now, pageable);

        return flightsPage.map(FlightItineraryDto::fromFlight);
    }

}
