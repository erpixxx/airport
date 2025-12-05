package dev.erpix.airport.domain.user;

import dev.erpix.airport.domain.user.dto.UserCredentialsDto;
import dev.erpix.airport.domain.user.dto.UserSummaryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public UserSummaryDto authenticate(UserCredentialsDto credentials) {
        User user = userRepository.findByEmailAndPassword(
                credentials.email(), credentials.password())
                .orElseThrow(() -> new IllegalArgumentException("Invalid email or password"));
        return UserSummaryDto.fromUser(user);
    }

    public User getUserById(int userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found with id: " + userId));
    }

}
