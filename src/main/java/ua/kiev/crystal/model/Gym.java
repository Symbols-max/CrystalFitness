package ua.kiev.crystal.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class Gym {
    @Id
    @GeneratedValue
    private long id;

    @OneToMany(mappedBy="gym", cascade=CascadeType.ALL)
    private List<Trainer> trainers = new ArrayList<>();

    private String adress;
    private String phone;

    public Gym(String adress, String phone) {
        this.adress = adress;
        this.phone=phone;
    }

}
