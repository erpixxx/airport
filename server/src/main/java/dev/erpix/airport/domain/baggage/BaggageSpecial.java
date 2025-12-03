package dev.erpix.airport.domain.baggage;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "baggage_special")
@DiscriminatorValue("SPECIAL")
@PrimaryKeyJoinColumn(name = "baggage_id")
public class BaggageSpecial extends Baggage {

    @Nationalized
    @Column(name = "category", nullable = false, length = 50)
    private String category;

    @Nationalized
    @Column(name = "handling_instructions", length = 500)
    private String handlingInstructions;

    @ColumnDefault("0")
    @Column(name = "is_fragile")
    private Boolean isFragile;

}