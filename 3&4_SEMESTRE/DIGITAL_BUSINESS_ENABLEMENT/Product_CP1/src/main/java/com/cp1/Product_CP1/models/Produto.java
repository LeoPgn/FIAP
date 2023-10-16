package com.cp1.Product_CP1.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;

@Getter
@Setter
@Entity
public class Produto {
    @Id
    private Long id;
    private String nome;
    private Double preco;
    private Integer estoque;
}
