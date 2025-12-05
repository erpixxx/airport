package dev.erpix.airport.domain.user.dto;

public record UserCredentialsDto(
        String email,
        String password
) { }
