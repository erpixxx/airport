package dev.erpix.airport.domain.baggage;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;

@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "baggage_insured")
@DiscriminatorValue("INSURED")
@PrimaryKeyJoinColumn(name = "baggage_id")
public class BaggageInsured extends Baggage {

    @Column(name = "insurance_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal insuranceAmount;

    @Nationalized
    @Column(name = "policy_number", length = 100)
    private String policyNumber;

}