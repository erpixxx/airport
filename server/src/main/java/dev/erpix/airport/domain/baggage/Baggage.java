package dev.erpix.airport.domain.baggage;

import dev.erpix.airport.domain.ticket.Ticket;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;

@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "baggage")
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "baggage_type", discriminatorType = DiscriminatorType.STRING)
public class Baggage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ticket_id", nullable = false)
    private Ticket ticket;

    @Nationalized
    @Column(name = "tag", nullable = false)
    private String tag;

    @Column(name = "weight", nullable = false, precision = 5, scale = 2)
    private BigDecimal weight;

}