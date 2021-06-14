package ua.kiev.crystal.service;

import ua.kiev.crystal.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.crystal.repositories.*;

import java.beans.Transient;
import java.util.List;

@Service
public class GymServiceImpl implements GymService {

    @Autowired
    private GalleryRepository galleryRepository;

    @Autowired
    private GymRepository gymRepository;

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private TrainerRepository trainerRepository;

    @Override @Transactional
    public void addGym(Gym gym) {
    gymRepository.save(gym);
    }

    @Override @Transactional
    public void addPhoto(Gallery gallery) {
     galleryRepository.save(gallery);
    }



    @Override @Transactional
    public void addNews(News news) {
    newsRepository.save(news);
    }

    @Override @Transactional
    public void addTrainer(Trainer trainer) {
    trainerRepository.save(trainer);
    }

    @Override
    @Transactional(readOnly=true)
    public Gym findGym(long id) {
        return gymRepository.findById(id).get();
    }

    @Override
    @Transactional(readOnly=true)
    public Trainer findTrainer(long id) {
        return trainerRepository.findById(id).get();
    }

    @Override
    @Transactional(readOnly=true)
    public Gallery findPhoto(long id) {
        return galleryRepository.findById(id).get();
    }

    @Override
    @Transactional(readOnly=true)
    public News findNewsOne(long id) {
        return newsRepository.findById(id).get();
    }

    @Override
    @Transactional(readOnly=true)
    public List<Gym> findGyms() {
        return gymRepository.findAll();
    }

    @Override
    @Transactional(readOnly=true)
    public List<Gallery> findPhotos() {
        return galleryRepository.findAll();
    }

    @Override
    @Transactional(readOnly=true)
    public List<News> findNews() {
        return newsRepository.findAll();
    }

    @Override
    @Transactional(readOnly=true)
    public List<Trainer> findTrainers() {
        return trainerRepository.findAll();
    }

    @Override @Transactional
    public void deleteGym(long[] ids) {
        for (long id:ids) {
        gymRepository.deleteById(id);
        }
    }

    @Override @Transactional
    public void deletePhoto(long[] ids) {
        for (long id:ids) {
            galleryRepository.deleteById(id);
        }
    }


    @Override @Transactional
    public void deleteNews(long[] ids) {
        for (long id:ids) {
            newsRepository.deleteById(id);
        }
    }

    @Override @Transactional
    public void deleteTrainer(long[] ids) {
        for (long id:ids) {
            trainerRepository.deleteById(id);
        }
    }

    @Override @Transactional
    public long countGym() {
        return gymRepository.count();
    }

    @Override @Transactional
    public long countPhoto() {
        return galleryRepository.count();
    }

    @Override @Transactional
    public long countNews() {
        return newsRepository.count();
    }

    @Override @Transactional
    public long countTrainer() {
        return trainerRepository.count();
    }



}
