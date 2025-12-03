package dev.erpix.airport.domain.flight.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class FlightItineraryDto {
    private String totalDuration;
    private int stopCount;
    private List<FlightSegmentDto> segments;
}
