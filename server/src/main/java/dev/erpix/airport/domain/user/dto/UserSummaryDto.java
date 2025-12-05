package dev.erpix.airport.domain.user.dto;

import dev.erpix.airport.domain.user.User;

public record UserSummaryDto(
    int id,
    String name,
    String email
) {

    public static UserSummaryDto fromUser(User user) {
        return new UserSummaryDto(
            user.getId(),
            user.getName(),
            user.getEmail()
        );
    }

}
