package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

//RM96562 - LEONARDO PAGANINI
//RM97305 - JHONN BRANDON
//RM97032 - REGINA POMPEO
//RM96893 - MATHEUS LEITE OLIVEIRA SCALFO


public class Main {
    public static void main(String[] args) {
        var entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

    }
}