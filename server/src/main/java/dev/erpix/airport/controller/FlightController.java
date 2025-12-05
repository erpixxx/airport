package dev.erpix.airport.controller;

import dev.erpix.airport.domain.flight.FlightService;
import dev.erpix.airport.domain.flight.dto.FlightItineraryDto;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/flights")
@RequiredArgsConstructor
public class FlightController {

    private final FlightService flightService;

    @GetMapping
    public Page<FlightItineraryDto> getFlightsFromTo(
            @RequestParam String from,
            @RequestParam String to,
            @ParameterObject
            @PageableDefault(size = 10, sort = "departure", direction = Sort.Direction.ASC)
            Pageable pageable
    ) {
        return flightService.getFlightsFromTo(from, to, pageable);
    }

    @GetMapping("/upcoming")
    public Page<FlightItineraryDto> getUpcomingFlights(
            @RequestParam String from,
            @ParameterObject
            @PageableDefault(size = 10, sort = "departure", direction = Sort.Direction.ASC)
            Pageable pageable
    ) {
        return flightService.getUpcomingFlights(from, pageable);
    }

}
