package dev.erpix.airport.controller;

import dev.erpix.airport.domain.passenger.PassengerService;
import dev.erpix.airport.domain.passenger.dto.PassengerCreateRequestDto;
import dev.erpix.airport.domain.passenger.dto.PassengerSummaryDto;
import dev.erpix.airport.domain.passenger.dto.PassengerUpdateRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/api/passengers")
@RequiredArgsConstructor
public class PassengerController {

    private final PassengerService passengerService;

    @PostMapping
    public ResponseEntity<PassengerSummaryDto> createPassenger(@RequestBody PassengerCreateRequestDto requestDto) {
        PassengerSummaryDto passenger = passengerService.createPassenger(requestDto);
        return ResponseEntity.ok(passenger);
    }

    @DeleteMapping
    public ResponseEntity<Void> deletePassenger(@RequestParam int passengerId) {
        passengerService.deletePassenger(passengerId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<Set<PassengerSummaryDto>> getPassengers(@RequestParam int userId) {
        Set<PassengerSummaryDto> passengers = passengerService.getPassengersByUserId(userId);
        return ResponseEntity.ok(passengers);
    }

    @PatchMapping
    public ResponseEntity<PassengerSummaryDto> updatePassenger(@RequestBody PassengerUpdateRequestDto requestDto) {
        PassengerSummaryDto updatedPassenger = passengerService.updatePassenger(requestDto);
        return ResponseEntity.ok(updatedPassenger);
    }

}
