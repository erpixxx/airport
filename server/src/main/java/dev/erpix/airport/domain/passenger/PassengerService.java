package dev.erpix.airport.domain.passenger;

import dev.erpix.airport.domain.passenger.dto.PassengerCreateRequestDto;
import dev.erpix.airport.domain.passenger.dto.PassengerSummaryDto;
import dev.erpix.airport.domain.passenger.dto.PassengerUpdateRequestDto;
import dev.erpix.airport.domain.user.User;
import dev.erpix.airport.domain.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PassengerService {

    private final PassengerRepository passengerRepository;
    private final UserService userService;

    public PassengerSummaryDto createPassenger(PassengerCreateRequestDto requestDto) {
        User user = userService.getUserById(requestDto.userId());
        Passenger passenger = Passenger.builder()
                .firstName(requestDto.firstName())
                .lastName(requestDto.lastName())
                .dateOfBirth(requestDto.dateOfBirth())
                .passportNumber(requestDto.passportNumber())
                .user(user)
                .build();
        Passenger savedPassenger = passengerRepository.save(passenger);
        return PassengerSummaryDto.fromPassenger(savedPassenger);
    }

    public void deletePassenger(int passengerId) {
        passengerRepository.deleteById(passengerId);
    }

    public Set<PassengerSummaryDto> getPassengersByUserId(int userId) {
        return passengerRepository.findByUserId(userId).stream()
                .map(PassengerSummaryDto::fromPassenger)
                .collect(Collectors.toSet());
    }

    public PassengerSummaryDto updatePassenger(PassengerUpdateRequestDto requestDto) {
        Passenger passenger = passengerRepository.findById(requestDto.id())
                .orElseThrow(() -> new IllegalArgumentException("Passenger not found with id: " + requestDto.id()));
        if (requestDto.firstName() != null) {
            passenger.setFirstName(requestDto.firstName());
        }
        if (requestDto.lastName() != null) {
            passenger.setLastName(requestDto.lastName());
        }
        if (requestDto.dateOfBirth() != null) {
            passenger.setDateOfBirth(requestDto.dateOfBirth());
        }
        if (requestDto.passportNumber() != null) {
            passenger.setPassportNumber(requestDto.passportNumber());
        }
        Passenger updatedPassenger = passengerRepository.save(passenger);
        return PassengerSummaryDto.fromPassenger(updatedPassenger);
    }

}
