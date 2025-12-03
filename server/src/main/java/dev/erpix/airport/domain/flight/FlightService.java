package dev.erpix.airport.domain.flight;

import dev.erpix.airport.domain.flight.dto.FlightItineraryDto;
import dev.erpix.airport.domain.flight.dto.FlightSegmentDto;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FlightService {

    private final FlightRepository flightRepository;

    @Transactional
    public List<FlightItineraryDto> searchFlights(String fromCode, String toCode, LocalDate date) {
        // 1. Ustal zakres czasu (cały dany dzień)
        OffsetDateTime startOfDay = date.atTime(LocalTime.MIN).atOffset(ZoneOffset.UTC); // Uproszczenie strefy
        OffsetDateTime endOfDay = date.atTime(LocalTime.MAX).atOffset(ZoneOffset.UTC);

        // 2. Pobierz wszystkie loty startujące z "fromCode" w tym dniu
        List<Flight> startFlights = flightRepository.findFlightsByRoute(fromCode, startOfDay, endOfDay);

        List<FlightItineraryDto> results = new ArrayList<>();

        // 3. Budowanie tras
        for (Flight startFlight : startFlights) {
            List<FlightSegmentDto> path = new ArrayList<>();
            Flight current = startFlight;

            // Pętla "idziemy po sznurku" przesiadek
            while (current != null) {
                path.add(FlightSegmentDto.fromFlight(current));
                current = current.getConnectingFlight(); // Przejdź do następnego lotu (jeśli istnieje)
            }

            // 4. Sprawdzenie, czy ostatni lot w łańcuchu ląduje tam, gdzie chcemy
            FlightSegmentDto lastLeg = path.getLast();
            if (lastLeg.getArrivalCode().equalsIgnoreCase(toCode)) {

                // Mamy pasujące połączenie! Pakujemy w DTO
                results.add(FlightItineraryDto.builder()
                        .segments(path)
                        .stopCount(path.size() - 1)
                        // Tutaj można dodać logikę obliczania czasu trwania (Arrival ostatniego - Departure pierwszego)
                        .build());
            }
        }

        return results;
    }

    public Page<FlightSegmentDto> getUpcomingFlights(Pageable pageable) {
        OffsetDateTime now = OffsetDateTime.now();

        Page<Flight> flightsPage = flightRepository.findUpcomingFlights(now, pageable);

        return flightsPage.map(FlightSegmentDto::fromFlight);
    }

}
