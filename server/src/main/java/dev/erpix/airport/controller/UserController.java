package dev.erpix.airport.controller;

import dev.erpix.airport.domain.user.UserService;
import dev.erpix.airport.domain.user.dto.UserCredentialsDto;
import dev.erpix.airport.domain.user.dto.UserSummaryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/authenticate")
    public ResponseEntity<UserSummaryDto> authenticate(@RequestBody UserCredentialsDto credentials) {
        UserSummaryDto user = userService.authenticate(credentials);
        return ResponseEntity.ok(user);
    }

}
