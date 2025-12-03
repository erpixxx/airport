package dev.erpix.airport.domain.terminal;

import dev.erpix.airport.domain.airport.Airport;
import dev.erpix.airport.domain.gate.Gate;
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
@Table(name = "terminals")
public class Terminal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "airport_id", nullable = false)
    private Airport airport;

    @Nationalized
    @Column(name = "code", nullable = false, length = 10)
    private String code;

    @OneToMany(mappedBy = "terminal")
    @Builder.Default
    private Set<Gate> gates = new LinkedHashSet<>();

}