package dev.erpix.airport.domain.flight;

import dev.erpix.airport.domain.gate.Gate;
import dev.erpix.airport.domain.plane.Plane;
import dev.erpix.airport.domain.ticket.Ticket;
import dev.erpix.airport.domain.airline.Airline;
import dev.erpix.airport.domain.airport.Airport;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import java.time.OffsetDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "flights")
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "airline_id", nullable = false)
    private Airline airline;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "plane_id", nullable = false)
    private Plane plane;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "departure_airport_id", nullable = false)
    private Airport departureAirport;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "arrival_airport_id", nullable = false)
    private Airport arrivalAirport;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "departure_gate_id")
    private Gate departureGate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "arrival_gate_id")
    private Gate arrivalGate;

    @Nationalized
    @Column(name = "number", nullable = false)
    private String number;

    @Column(name = "departure", nullable = false)
    private OffsetDateTime departure;

    @Column(name = "arrival", nullable = false)
    private OffsetDateTime arrival;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "connecting_flight_id")
    private Flight connectingFlight;

    @OneToMany(mappedBy = "connectingFlight")
    @Builder.Default
    private Set<Flight> flights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "flight")
    @Builder.Default
    private Set<Ticket> tickets = new LinkedHashSet<>();

}