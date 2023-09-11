package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "email", nullable = false)
    private Long id;

    private String name;

    private String password;

    private Integer age;
    @Column(name = "card_information")
    private String information;
    @Column(name = "IP_adress")
    private String adress;

    private String device;

    @OneToMany(mappedBy = "customer", orphanRemoval = true)
    private List<Purchase> purchase;
}