package org.example.entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name="pizzas")
public class Pizza {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Long id;

    private String nome;
    private String ingredientes;
    private double preco;

    //@ManyToMany
    //private List<Pedido> pedidos = new ArrayList<>();

    @OneToMany(mappedBy = "Pizza")
    private List<PedidoPizza> pedidoPizzas = new ArrayList<>();
}
