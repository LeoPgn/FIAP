package org.example.models;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;
import org.example.models.baseEntity.Entidade;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "OrderStatusCode")
public class OrderStatusCode extends Entidade {
    private String status_code;
    private String description;

    @OneToMany
    private List<Order> orders;
}
