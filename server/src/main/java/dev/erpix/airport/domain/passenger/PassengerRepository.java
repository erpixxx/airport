package dev.erpix.airport.domain.passenger;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface PassengerRepository extends JpaRepository<Passenger, Integer> {

    @Query("SELECT p FROM Passenger p WHERE p.user.id = :userId")
    Set<Passenger> findByUserId(@Param("userId") int userId);

}
