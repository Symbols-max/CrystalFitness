package ua.kiev.crystal.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
@NoArgsConstructor
public class Gallery {
    @Id
    @GeneratedValue
    private long id;

    private String photo;

    public Gallery(String photo){
        this.photo = photo;
    }

}
