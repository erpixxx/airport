package dev.erpix.airport.domain.gate;

import dev.erpix.airport.domain.terminal.Terminal;
import dev.erpix.airport.domain.flight.Flight;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "gates")
public class Gate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "terminal_id", nullable = false)
    private Terminal terminal;

    @Nationalized
    @Column(name = "name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "departureGate")
    @Builder.Default
    private Set<Flight> departureFlights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "arrivalGate")
    @Builder.Default
    private Set<Flight> arrivalFlights = new LinkedHashSet<>();

}