package org.example.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class PedidoPizza {

    @EmbeddedId
    @ManyToOne
    @JoinColumn(name = "pedido_id")
    private Pedido Pedido;

    @EmbeddedId
    @ManyToOne
    @JoinColumn(name = "pizza_id")
    private Pizza Pizza;
}
