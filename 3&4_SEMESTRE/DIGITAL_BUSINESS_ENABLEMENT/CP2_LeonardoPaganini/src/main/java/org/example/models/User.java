package org.example.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;
    private String userName;
    private String userAdd;
    private String userEmail;
    private double userContactNo;

    @OneToMany(mappedBy = "user", orphanRemoval = true)
    private List<Vehicle> vehicles;

    @OneToMany(mappedBy = "user", orphanRemoval = true)
    private List<Payment> payments;
}
