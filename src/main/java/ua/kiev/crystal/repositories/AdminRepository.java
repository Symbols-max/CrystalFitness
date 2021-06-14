package ua.kiev.crystal.repositories;

import ua.kiev.crystal.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface AdminRepository extends JpaRepository<Admin, Long> {
    @Query("SELECT a FROM Admin a where a.login = :login")
    Admin findByLogin(@Param("login") String login);

    @Query("SELECT CASE WHEN COUNT(a) > 0 THEN true ELSE false " +
            "END FROM Admin a WHERE a.login = :login")
    boolean existsByLogin(@Param("login") String login);
}
