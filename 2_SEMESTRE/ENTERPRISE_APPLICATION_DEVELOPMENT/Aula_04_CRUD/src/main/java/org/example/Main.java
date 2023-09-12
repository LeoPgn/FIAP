package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import org.example.model.Genre;

//RM96562 - LEONARDO PAGANINI
//RM97305 - JHONN BRANDON
//RM97032 - REGINA POMPEO
//RM96893 - MATHEUS LEITE OLIVEIRA SCALFO


public class Main {
    public static void main(String[] args) {
        var entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        //utilizando JPQL (é um recurso do Hibernate) para realizar um select, no caso abaixo:
        var jpql = "SELECT u FROM Genre u";
        var query = entityManager.createQuery(jpql, Genre.class);
        var genres = query.getResultList();
    }
}