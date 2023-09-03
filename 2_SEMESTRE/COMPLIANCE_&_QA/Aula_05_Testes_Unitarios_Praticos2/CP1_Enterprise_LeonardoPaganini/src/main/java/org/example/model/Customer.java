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
    @Column(name = "email_ID", nullable = false)
    private Long id;
    @Column(name = "customer_name")
    private String name;
    @Column(name = "customer_password")
    private String password;
    @Column(name = "customer_age")
    private Integer age;
    @Column(name = "card_information")
    private String information;
    @Column(name = "customer_ip_adress")
    private String adress;
    @Column(name = "customer_device")
    private String device;

}