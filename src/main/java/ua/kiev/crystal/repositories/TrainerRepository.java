package ua.kiev.crystal.repositories;

import ua.kiev.crystal.model.Trainer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainerRepository extends JpaRepository<Trainer,Long> {
}
