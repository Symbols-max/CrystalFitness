package ua.kiev.crystal.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.kiev.crystal.model.Gallery;
import ua.kiev.crystal.model.Gym;
import ua.kiev.crystal.model.News;
import ua.kiev.crystal.model.Trainer;
import ua.kiev.crystal.other.Sender;
import ua.kiev.crystal.service.GymServiceImpl;

import java.util.*;

@Controller
public class GymController {
    @Autowired
    private GymServiceImpl gymServiceImpl;

    @RequestMapping("/gym_add_page")
    public String gymAddPage() {
        return "gym_add_page";
    }

    @RequestMapping(value="/gym/add", method = RequestMethod.POST)
    public String gymAdd(@RequestParam String adress,
                             @RequestParam String phone)
    {
        Gym gym = new Gym(adress, phone);
        gymServiceImpl.addGym(gym);

        return "redirect:/adminka_clubs";
    }

    @RequestMapping(value = "/gym/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> deleteGym(@RequestParam(value = "toDelete[]", required = false)
                                               long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
           gymServiceImpl.deleteGym(toDelete);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/photo_add_page")
    public String galleryAddPage() {
        return "photo_add_page";
    }

    @RequestMapping(value="/photo/add", method = RequestMethod.POST)
    public String galleryAdd(@RequestParam String photo)
    {
        Gallery gallery = new Gallery(photo);
        gymServiceImpl.addPhoto(gallery);

        return "redirect:/adminka_gallery";
    }

    @RequestMapping(value = "/photo/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> deletePhoto(@RequestParam(value = "toDelete[]", required = false)
                                               long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            gymServiceImpl.deletePhoto(toDelete);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/news_add_page")
    public String newsAddPage() {
        return "news_add_page";
    }

    @RequestMapping(value="/news/add", method = RequestMethod.POST)
    public String newsAdd(@RequestParam String title,
                          @RequestParam String shortDescription,
                          @RequestParam String text)
    {
        Date date=new Date();
        News news = new News(title,text,date,shortDescription);
        gymServiceImpl.addNews(news);

        return "redirect:/adminka_news";
    }

    @RequestMapping(value = "/news/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> deleteNews(@RequestParam(value = "toDelete[]", required = false)
                                               long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            gymServiceImpl.deleteNews(toDelete);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/trainers_add_page")
    public String trainersAddPage(Model model) {
        model.addAttribute("gyms", gymServiceImpl.findGyms());
        return "trainers_add_page";
    }

    @RequestMapping(value="/trainers/add", method = RequestMethod.POST)
        public String trainersAdd(@RequestParam(value = "gym") long gymId,
                        @RequestParam String name,
                          @RequestParam String age,
                          @RequestParam String description,
                                  @RequestParam String achivment,
                          @RequestParam String photo)
    {
        Gym gym = gymServiceImpl.findGym(gymId);
        Trainer trainer=new Trainer(gym,name,age,description,achivment,photo);
        gymServiceImpl.addTrainer(trainer);

        return "redirect:/adminka_trainers";
    }

    @RequestMapping(value="/contacts/add", method = RequestMethod.POST)
    public String contactsAdd(@RequestParam(value = "name") String name,
                              @RequestParam (value="phone") String number)
    {
        Sender sender=new Sender();
        sender.send("Имя гостя:"+name+",\t"+"Номер гостя:"+number);
        return "redirect:/#";
    }

    @RequestMapping(value = "/trainers/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> delete(@RequestParam(value = "toDelete[]", required = false)
                                               long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            gymServiceImpl.deleteTrainer(toDelete);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/adminka_trainers")
    public String adminkaTrainers(Model model){
        List<Trainer> trainers  =gymServiceImpl.findTrainers();
        model.addAttribute("trainers", trainers);
        return "adminka_trainers";
    }

    @RequestMapping("/adminka_news")
    public String adminkaNews(Model model){
        List<News> news=gymServiceImpl.findNews();
        model.addAttribute("newss", news);
        return "adminka_news";
    }

    @RequestMapping("/adminka_gallery")
    public String adminkaGallery(Model model){
        List<Gallery> galleries = gymServiceImpl.findPhotos();
        model.addAttribute("galleries", galleries);
        return "adminka_gallery";
    }

    @RequestMapping("/adminka_clubs")
    public String adminkaClubs(Model model){
        List<Gym> gyms = gymServiceImpl.findGyms();
        model.addAttribute("gyms", gyms);
        return "adminka_clubs";
    }

    @RequestMapping("/description_trainer/{id}")
    public String descriptionTrainer(@PathVariable(value = "id") long id,
                                     Model model) {
        Trainer trainer =gymServiceImpl.findTrainer(id);
        String description=trainer.getDescription();
        model.addAttribute("description", description);
        return "description_trainer";
    }
    @RequestMapping("/achivment_trainer/{id}")
    public String achivmentTrainer(@PathVariable(value = "id") long id,
                                     Model model) {
        Trainer trainer =gymServiceImpl.findTrainer(id);
        String achivment=trainer.getAchivment();
        model.addAttribute("achivment",achivment);
        return "achivment_trainer";
    }
    @RequestMapping("/photo_trainer/{id}")
    public String photoTrainer(@PathVariable(value = "id") long id,
                                   Model model) {
        Trainer trainer =gymServiceImpl.findTrainer(id);
        String photo=trainer.getPhoto();
        model.addAttribute("photo", photo);
        return "photo_trainer";
    }

    @RequestMapping("/photo_gallery/{id}")
    public String photoGallery(@PathVariable(value = "id") long id,
                               Model model) {
        Gallery gallery =gymServiceImpl.findPhoto(id);
        String photo=gallery.getPhoto();
        model.addAttribute("photo", photo);
        return "photo_gallery";
    }

    @RequestMapping("/full_news/{id}")
    public String fullNews(@PathVariable(value = "id") long id,
                               Model model) {
        News news =gymServiceImpl.findNewsOne(id);
        String full=news.getText();
        model.addAttribute("full", full);
        return "full_news";
    }
    @RequestMapping("/team")
    public String team(Model model){
        List<Trainer> trainers  =gymServiceImpl.findTrainers();
        List<Trainer> trainers1 = new ArrayList<>();
        List<Trainer> trainers2= new ArrayList<>();
        List<Trainer> trainers3 = new ArrayList<>();
        Iterator<Trainer> itr=trainers.iterator();
        for (int i=1; itr.hasNext();i++){
            if(i%2==0){
                    trainers2.add(itr.next());
            }
            else trainers1.add(itr.next());
        }
        if (trainers1.size()!=trainers2.size()){
            Trainer trainer=trainers1.get(trainers1.size()-1);
            trainers1.remove(trainers1.size()-1);
            trainers3.add(trainer);
        }
        model.addAttribute("trainers3", trainers3);
        model.addAttribute("trainers1", trainers1);
        model.addAttribute("trainers2", trainers2);
        return "team";
    }
    @RequestMapping("/trainer/{id}")
    public String trainer(@PathVariable(value = "id") long id,
                                     Model model) {
        Trainer trainer =gymServiceImpl.findTrainer(id);
        model.addAttribute("trainer", trainer);
        return "trainer";
    }

    @RequestMapping("/news")
    public String news(Model model){
        List<News> news=gymServiceImpl.findNews();
        model.addAttribute("newss", news);
        return "news";
    }

    @RequestMapping("/gallery")
    public String gallery(Model model){
        List<Gallery> photos=gymServiceImpl.findPhotos();
        model.addAttribute("photos", photos);
        return "gallery";
    }
}
