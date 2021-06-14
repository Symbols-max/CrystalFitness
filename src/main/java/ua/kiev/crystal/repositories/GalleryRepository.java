package ua.kiev.crystal.repositories;

import ua.kiev.crystal.model.Gallery;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GalleryRepository extends JpaRepository <Gallery,Long> {

}
