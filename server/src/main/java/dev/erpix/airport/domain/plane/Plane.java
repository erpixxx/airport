package dev.erpix.airport.domain.plane;

import dev.erpix.airport.domain.seat.Seat;
import dev.erpix.airport.domain.airline.Airline;
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
@Table(name = "planes")
public class Plane {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "airline_id", nullable = false)
    private Airline airline;

    @Nationalized
    @Column(name = "model_name", nullable = false)
    private String modelName;

    @Nationalized
    @Column(name = "tail_number", nullable = false)
    private String tailNumber;

    @OneToMany(mappedBy = "plane")
    @Builder.Default
    private Set<Flight> flights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "plane")
    @Builder.Default
    private Set<PlaneFeature> features = new LinkedHashSet<>();

    @OneToMany(mappedBy = "plane")
    @Builder.Default
    private Set<Seat> seats = new LinkedHashSet<>();

}