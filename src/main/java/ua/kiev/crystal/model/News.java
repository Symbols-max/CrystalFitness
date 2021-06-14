package ua.kiev.crystal.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
public class News {
    @Id
    @GeneratedValue
    private long id;

    private String title;
    private String shortDescription;
    private String text;
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    public News(String title, String text, Date date, String shortDescription) {
        this.title = title;
        this.text = text;
        this.date = date;
        this.shortDescription = shortDescription;
    }
}
