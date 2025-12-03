package dev.erpix.airport.domain.airline;

import dev.erpix.airport.domain.flight.Flight;
import dev.erpix.airport.domain.plane.Plane;
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
@Table(name = "airlines")
public class Airline {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Nationalized
    @Column(name = "name", nullable = false)
    private String name;

    @Nationalized
    @Column(name = "code", nullable = false)
    private String code;

    @OneToMany(mappedBy = "airline")
    @Builder.Default
    private Set<Flight> flights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "airline")
    @Builder.Default
    private Set<Plane> planes = new LinkedHashSet<>();

}