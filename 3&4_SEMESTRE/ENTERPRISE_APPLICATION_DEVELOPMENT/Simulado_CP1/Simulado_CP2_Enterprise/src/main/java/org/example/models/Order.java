package org.example.models;

import jakarta.persistence.*;
import lombok.*;
import org.example.models.baseEntity.Entidade;

import java.util.List;

@Getter
@Setter
@ToString
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Order")
public class Order extends Entidade {

    private Integer costumer_id;

    private String customer_comments;

    @ManyToOne
    @JoinColumn(name = "status_code_id")
    private OrderStatusCode orderStatusCode;

    @OneToMany
    private List<OrderItem> orderItems;
}
