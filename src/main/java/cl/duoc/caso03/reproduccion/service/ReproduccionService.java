package cl.duoc.caso03.reproduccion.service;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import cl.duoc.caso03.reproduccion.model.Reproduccion;
import cl.duoc.caso03.reproduccion.repository.ReproduccionRepository;

@Service
public class ReproduccionService {

    private final ReproduccionRepository repository;

    public ReproduccionService(ReproduccionRepository repository) {
        this.repository = repository;
    }

    public List<Reproduccion> findAll() {
        return repository.findAll();
    }

    public Optional<Reproduccion> findById(Long id) {
        return repository.findById(id);
    }

    public Reproduccion create(Reproduccion recurso) {
        return repository.save(recurso);
    }

    public Optional<Reproduccion> update(Long id, Reproduccion datos) {
        return repository.findById(id).map(existente -> {
            existente.setNombre(datos.getNombre());
            existente.setContenido(datos.getContenido());
            existente.setProgreso(datos.getProgreso());
            return repository.save(existente);
        });
    }

    public boolean delete(Long id) {
        return repository.findById(id).map(existente -> {
            repository.delete(existente);
            return true;
        }).orElse(false);
    }
}
