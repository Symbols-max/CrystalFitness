package ua.kiev.crystal.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class Trainer {
    @Id
    @GeneratedValue
    private long id;

    @ManyToOne
    @JoinColumn(name="gym_id")
    private Gym gym;

    private String name;
    private String age;
    private String achivment;
    private String description;
    private String photo;

    public Trainer(Gym gym,String name, String age, String description, String achivment,String photo) {
        this.name = name;
        this.age = age;
        this.description = description;
        this.photo = photo;
        this.gym=gym;
        this.achivment=achivment;
    }
}
