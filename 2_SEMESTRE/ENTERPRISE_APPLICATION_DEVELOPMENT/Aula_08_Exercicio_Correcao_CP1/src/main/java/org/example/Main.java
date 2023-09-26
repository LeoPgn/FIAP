package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;



public class Main {
    public static void main(String[] args) {
        var entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

    }
}