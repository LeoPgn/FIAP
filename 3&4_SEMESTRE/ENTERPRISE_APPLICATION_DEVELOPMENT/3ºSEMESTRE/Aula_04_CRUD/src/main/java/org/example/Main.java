package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import org.example.model.Genre;


public class Main {
    public static void main(String[] args) {
        var entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        //utilizando JPQL (é um recurso do Hibernate) para realizar um select, no caso abaixo:
        //var jpql = "SELECT u FROM Genre u"; //utilizamos "u" pois é uma sintaxe para todos os bancos, usando o JPQL
        //var query = entityManager.createQuery(jpql, Genre.class);
        //var genres = query.getResultList();

        //utilizando parametros do banco para a query de forma mais nativa
        var genre = entityManager.find(Genre.class, 1);

        var jpql = "SELECT u FROM Genre u WHERE genre_name =:genre_"; //quando colocamos :, o que vem dps é um parâmetro
        var query = entityManager.createQuery(jpql, Genre.class).setParameter("genre_", "ROCK");
        genre = query.getSingleResult();

    }
}