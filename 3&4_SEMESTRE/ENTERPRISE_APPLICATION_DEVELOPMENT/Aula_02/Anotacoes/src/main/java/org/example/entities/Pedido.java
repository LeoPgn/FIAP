package org.example.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "pedidos")
public class Pedido {

    @Id
    @Column(name = "id", nullable = false)
    private UUID id;

    private OffsetDateTime Data;


    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;

    //@ManyToMany
    //private List<Pizza> pizza = new ArrayList<>();

    @OneToMany(mappedBy = "Pedido")
    private List<PedidoPizza> pedidoPizzas = new ArrayList<>();
}
