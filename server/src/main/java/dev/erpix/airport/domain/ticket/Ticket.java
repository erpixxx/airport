package dev.erpix.airport.domain.ticket;

import dev.erpix.airport.domain.baggage.Baggage;
import dev.erpix.airport.domain.flight.Flight;
import dev.erpix.airport.domain.passenger.Passenger;
import dev.erpix.airport.domain.seat.Seat;
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
@Table(name = "tickets")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "flight_id", nullable = false)
    private Flight flight;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "passenger_id", nullable = false)
    private Passenger passenger;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "seat_id", nullable = false)
    private Seat seat;

    @Nationalized
    @Column(name = "code", nullable = false)
    private String code;

    @Column(name = "booked_at")
    private OffsetDateTime bookedAt;

    @OneToMany(mappedBy = "ticket")
    @Builder.Default
    private Set<Baggage> baggages = new LinkedHashSet<>();

}