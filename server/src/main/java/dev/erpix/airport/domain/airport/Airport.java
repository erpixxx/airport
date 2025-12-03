package dev.erpix.airport.domain.airport;

import dev.erpix.airport.domain.flight.Flight;
import dev.erpix.airport.domain.terminal.Terminal;
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
@Table(name = "airports")
public class Airport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Nationalized
    @Column(name = "code", nullable = false, length = 3)
    private String code;

    @Nationalized
    @Column(name = "name", nullable = false)
    private String name;

    @Nationalized
    @Column(name = "country", nullable = false)
    private String country;

    @Nationalized
    @Column(name = "city", nullable = false)
    private String city;

    @OneToMany(mappedBy = "departureAirport", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<Flight> departureFlights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "arrivalAirport")
    @Builder.Default
    private Set<Flight> arrivalFlights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "airport")
    @Builder.Default
    private Set<Terminal> terminals = new LinkedHashSet<>();

}