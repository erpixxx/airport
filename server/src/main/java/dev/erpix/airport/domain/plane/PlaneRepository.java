package dev.erpix.airport.domain.plane;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface PlaneRepository extends JpaRepository<Plane, Integer> {
}
