package org.example.entities;


import jakarta.persistence.*;
import lombok.*;
import org.example.entities.valueobjects.Endereco;
import org.example.entities.valueobjects.Telefone;
import org.hibernate.collection.spi.PersistentIdentifierBag;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "clientes")
public class Cliente {
    @ToString.Include
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Long id;
    private String nome;
    private String cpf;
    private int idade;
    private int altura;
    private int peso;

    @Column(unique = true)
    private String email;
    @Embedded
    private Telefone telefone;
    @Embedded
    private Endereco endereco;

    @OneToMany(mappedBy = "cliente", orphanRemoval = true)
    private List<Pedido> pedidos = new ArrayList<>();
}
