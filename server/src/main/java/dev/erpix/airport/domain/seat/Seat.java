package dev.erpix.airport.domain.seat;

import dev.erpix.airport.domain.ticket.Ticket;
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
@Table(name = "seats")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "plane_id", nullable = false)
    private Plane plane;

    @Nationalized
    @Column(name = "number", nullable = false)
    private String number;

    @Nationalized
    @Column(name = "type")
    private String type;

    @OneToMany(mappedBy = "seat")
    private Set<Ticket> tickets = new LinkedHashSet<>();

}