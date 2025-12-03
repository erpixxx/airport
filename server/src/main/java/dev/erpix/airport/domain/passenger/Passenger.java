package dev.erpix.airport.domain.passenger;

import dev.erpix.airport.domain.ticket.Ticket;
import dev.erpix.airport.domain.user.User;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "passengers")
public class Passenger {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Nationalized
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Nationalized
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "date_of_birth", nullable = false)
    private LocalDate dateOfBirth;

    @Nationalized
    @Column(name = "passport_number", nullable = false)
    private String passportNumber;

    @OneToMany(mappedBy = "passenger")
    @Builder.Default
    private Set<Ticket> tickets = new LinkedHashSet<>();

}