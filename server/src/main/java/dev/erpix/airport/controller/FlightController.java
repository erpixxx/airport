package dev.erpix.airport.controller;

import dev.erpix.airport.domain.flight.FlightService;
import dev.erpix.airport.domain.flight.dto.FlightItineraryDto;
import dev.erpix.airport.domain.flight.dto.FlightSegmentDto;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/flights")
@RequiredArgsConstructor
public class FlightController {

    private final FlightService flightService;

    @GetMapping("/search")
    public List<FlightItineraryDto> search(
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date
    ) {
        return flightService.searchFlights(from, to, date);
    }

    @GetMapping("/upcoming")
    public Page<FlightSegmentDto> getUpcomingFlights(
            @ParameterObject
            @PageableDefault(size = 10, sort = "departure", direction = Sort.Direction.ASC)
            Pageable pageable
    ) {
        return flightService.getUpcomingFlights(pageable);
    }

}
