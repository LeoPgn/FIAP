package org.example;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.models.Album;
import org.example.models.Artist;
import org.example.models.Track;
import org.example.repositories.AlbumRepository;
import org.example.repositories.ArtistRepository;
import org.example.repositories.JpaRepository;
import org.example.repositories.TrackRepository;

public class Main {
    public static void main(String[] args) {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("postgres");
            EntityManager entityManager = entityManagerFactory.createEntityManager();

            var albumRepository = new AlbumRepository(entityManager);

            entityManager.close();
            entityManagerFactory.close();
        } catch (Exception e) {
            throw e;
        }
    }
}