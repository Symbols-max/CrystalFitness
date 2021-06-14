package ua.kiev.crystal.service;

import org.springframework.transaction.annotation.Transactional;
import ua.kiev.crystal.model.*;

import java.util.List;

public interface GymService {
    void addGym(Gym gym);
    void addPhoto(Gallery gallery);
    void addNews(News news);
    void addTrainer(Trainer trainer);

    public Gym findGym(long id);
    public Trainer findTrainer(long id);
    public Gallery findPhoto(long id);
    public News findNewsOne(long id);
    public List<Gym> findGyms();
    public List<Gallery> findPhotos();
    public List<News> findNews();
    public List<Trainer> findTrainers();

    void deleteGym(long[] ids);
    void deletePhoto(long[] ids);
    void deleteNews(long[] ids);
    void deleteTrainer(long[] ids);

    long countGym();
    long countPhoto();
    long countNews();
    long countTrainer();

}
