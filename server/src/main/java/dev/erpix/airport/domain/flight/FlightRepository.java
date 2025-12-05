package dev.erpix.airport.domain.flight;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {

    @Query(
            value = "SELECT f FROM Flight f " +
                    "JOIN FETCH f.airline " +
                    "JOIN FETCH f.plane " +
                    "JOIN FETCH f.departureAirport da " +
                    "JOIN FETCH f.arrivalAirport aa " + // Dodano alias 'aa' dla czytelności
                    "LEFT JOIN FETCH f.departureGate " +
                    "LEFT JOIN FETCH f.arrivalGate " +

                    "LEFT JOIN FETCH f.connectingFlight cf1 " +
                    "LEFT JOIN FETCH cf1.airline " +
                    "LEFT JOIN FETCH cf1.plane " +
                    "LEFT JOIN FETCH cf1.departureAirport " +
                    "LEFT JOIN FETCH cf1.arrivalAirport cf1_aa " + // Alias dla przylotu 1. przesiadki
                    "LEFT JOIN FETCH cf1.departureGate " +
                    "LEFT JOIN FETCH cf1.arrivalGate " +

                    "LEFT JOIN FETCH cf1.connectingFlight cf2 " +
                    "LEFT JOIN FETCH cf2.airline " +
                    "LEFT JOIN FETCH cf2.plane " +
                    "LEFT JOIN FETCH cf2.departureAirport " +
                    "LEFT JOIN FETCH cf2.arrivalAirport cf2_aa " + // Alias dla przylotu 2. przesiadki

                    "WHERE da.code = :from " +
                    "AND f.departure > :now " +
                    "AND (" +
                    "   aa.code = :to " +
                    "   OR cf1_aa.code = :to " +
                    "   OR cf2_aa.code = :to " +
                    ")",

            countQuery = "SELECT count(f) FROM Flight f " +
                    "JOIN f.departureAirport da " +
                    "JOIN f.arrivalAirport aa " +
                    "LEFT JOIN f.connectingFlight cf1 " +
                    "LEFT JOIN cf1.arrivalAirport cf1_aa " +
                    "LEFT JOIN cf1.connectingFlight cf2 " +
                    "LEFT JOIN cf2.arrivalAirport cf2_aa " +
                    "WHERE da.code = :from " +
                    "AND f.departure > :now " +
                    "AND (aa.code = :to OR cf1_aa.code = :to OR cf2_aa.code = :to)"
    )
    Page<Flight> findFlightsFromTo(
            @Param("from") String fromCode,
            @Param("to") String toCode,
            @Param("now") OffsetDateTime now,
            Pageable pageable
    );

    @Query(
            value = "SELECT f FROM Flight f " +
                    "JOIN FETCH f.airline " +
                    "JOIN FETCH f.plane " +
                    "JOIN FETCH f.departureAirport da " +
                    "JOIN FETCH f.arrivalAirport " +
                    "LEFT JOIN FETCH f.departureGate " +
                    "LEFT JOIN FETCH f.arrivalGate " +

                    "LEFT JOIN FETCH f.connectingFlight cf1 " +
                    "LEFT JOIN FETCH cf1.airline " +
                    "LEFT JOIN FETCH cf1.plane " +
                    "LEFT JOIN FETCH cf1.departureAirport " +
                    "LEFT JOIN FETCH cf1.arrivalAirport " +
                    "LEFT JOIN FETCH cf1.departureGate " +
                    "LEFT JOIN FETCH cf1.arrivalGate " +

                    "LEFT JOIN FETCH cf1.connectingFlight cf2 " +
                    "LEFT JOIN FETCH cf2.airline " +
                    "LEFT JOIN FETCH cf2.plane " +
                    "LEFT JOIN FETCH cf2.departureAirport " +
                    "LEFT JOIN FETCH cf2.arrivalAirport " +

                    "WHERE da.code = :from " +
                    "AND f.departure > :now ",
            countQuery = "SELECT count(f) FROM Flight f " +
                    "JOIN f.departureAirport da " +
                    "WHERE da.code = :from AND f.departure > :now"
    )
    Page<Flight> findUpcomingFlights(
            @Param("from") String fromCode,
            @Param("now") OffsetDateTime now,
            Pageable pageable
    );

}
