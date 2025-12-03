package dev.erpix.airport.domain.baggage;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "baggage_standard")
@DiscriminatorValue("STANDARD")
@PrimaryKeyJoinColumn(name = "baggage_id")
public class BaggageStandard extends Baggage {

    @Nationalized
    @Column(name = "dimensions_cm", nullable = false, length = 50)
    private String dimensionsCm;

}