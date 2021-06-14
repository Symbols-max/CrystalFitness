package ua.kiev.crystal.repositories;

import ua.kiev.crystal.model.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface NewsRepository extends JpaRepository<News,Long> {
}
