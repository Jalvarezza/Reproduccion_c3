package cl.duoc.caso03.reproduccion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import cl.duoc.caso03.reproduccion.model.Reproduccion;

public interface ReproduccionRepository extends JpaRepository<Reproduccion, Long> {
}
