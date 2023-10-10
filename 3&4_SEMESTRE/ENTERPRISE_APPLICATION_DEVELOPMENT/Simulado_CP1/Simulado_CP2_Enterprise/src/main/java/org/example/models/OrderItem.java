package org.example.models;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "OrderItem")
public class OrderItem extends Entidade {
    private Integer product_id;
    private Integer quantity;
    private Float price;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order orders;

}
