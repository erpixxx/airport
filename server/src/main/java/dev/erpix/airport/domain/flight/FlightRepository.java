package dev.erpix.airport.domain.flight;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {

    @Query("SELECT f FROM Flight f " +
            // Pobieramy detale głównego lotu
            "JOIN FETCH f.airline " +
            "JOIN FETCH f.plane " +
            "JOIN FETCH f.departureAirport da " +
            "JOIN FETCH f.arrivalAirport " +

            // Pobieramy pierwszą przesiadkę (LEFT JOIN, bo może jej nie być)
            "LEFT JOIN FETCH f.connectingFlight cf " +
            "LEFT JOIN FETCH cf.airline " +
            "LEFT JOIN FETCH cf.plane " +
            "LEFT JOIN FETCH cf.departureAirport " +
            "LEFT JOIN FETCH cf.arrivalAirport " +

            // Pobieramy drugą przesiadkę (dla tras 3-odcinkowych)
            "LEFT JOIN FETCH cf.connectingFlight cf2 " +
            "LEFT JOIN FETCH cf2.airline " +
            "LEFT JOIN FETCH cf2.plane " +
            "LEFT JOIN FETCH cf2.departureAirport " +
            "LEFT JOIN FETCH cf2.arrivalAirport " +

            // Warunki wyszukiwania
            "WHERE da.code = :fromCode " +
            "AND f.departure BETWEEN :start AND :end")
    List<Flight> findFlightsByRoute(
            @Param("fromCode") String fromCode,
            @Param("start") OffsetDateTime start,
            @Param("end") OffsetDateTime end
    );

    @Query(
            value = "SELECT f FROM Flight f " +
                    "JOIN FETCH f.airline " +
                    "JOIN FETCH f.plane " +
                    "JOIN FETCH f.departureAirport " +
                    "JOIN FETCH f.arrivalAirport " +
                    "LEFT JOIN FETCH f.departureGate " + // LEFT, bo bramka może być null
                    "LEFT JOIN FETCH f.arrivalGate " +
                    "WHERE f.departure > :now",
            countQuery = "SELECT count(f) FROM Flight f WHERE f.departure > :now"
    )
    Page<Flight> findUpcomingFlights(
            @Param("now") OffsetDateTime now,
            Pageable pageable
    );

}
