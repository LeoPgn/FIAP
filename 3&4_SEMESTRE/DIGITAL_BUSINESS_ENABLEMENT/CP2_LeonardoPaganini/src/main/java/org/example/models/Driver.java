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
@Table(name="driver")
public class Driver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer driverID;
    private String DriverName;
    private String DriverAdd;
    private String DriverEmail;
    private Double DriverContactNo;

    @OneToMany(mappedBy = "driver", orphanRemoval = true)
    private List<Vehicle> Driver;

    @OneToMany(mappedBy = "driver", orphanRemoval = true)
    private List<Payment> payments;
}
