package ua.kiev.crystal.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import ua.kiev.crystal.other.Role;


import javax.persistence.*;

@Entity
@Data @NoArgsConstructor
public class Admin {
    @Id
    @GeneratedValue
    private Long id;

    private String login;
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    public Admin(String login, String password, Role role) {
        this.login = login;
        this.password = password;
        this.role = role;
    }
}
