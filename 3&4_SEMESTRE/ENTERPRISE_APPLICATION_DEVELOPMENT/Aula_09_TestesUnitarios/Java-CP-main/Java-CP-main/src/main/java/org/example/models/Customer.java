package org.example.models;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.valueObjects.CardInformation;

import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity

@Table(name="Customer")
public class Customer {

    @Id
    @Column(length = 50)
    private String email;

    private String name;
    private String password;
    private int age;
    @Embedded
    private CardInformation card_information;
    private int ip_adress;
    private String device;

    @OneToMany(mappedBy = "customer",fetch = FetchType.LAZY)
    private List<Purchase> purchase;


}
