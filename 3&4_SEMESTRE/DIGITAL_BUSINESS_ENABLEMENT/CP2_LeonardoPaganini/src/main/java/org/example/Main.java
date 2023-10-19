package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

public class Main {
    public static void main(String[] args) {
        var entityManagerFactory = Persistence.createEntityManagerFactory( "oracle");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

    }
}