package dev.erpix.airport.domain.plane.dto;

import dev.erpix.airport.domain.plane.Plane;

public record PlaneSummaryDto(
        String modelName,
        String tailNumber
) {

    public static PlaneSummaryDto fromPlane(Plane plane) {
        return new PlaneSummaryDto(
                plane.getModelName(),
                plane.getTailNumber()
        );
    }

}
