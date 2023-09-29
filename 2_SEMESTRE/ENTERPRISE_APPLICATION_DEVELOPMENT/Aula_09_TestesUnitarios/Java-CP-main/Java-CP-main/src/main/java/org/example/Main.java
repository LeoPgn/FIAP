package org.example;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.models.Album;
import org.example.models.Artist;
import org.example.models.Track;
import org.example.repositories.ArtistRepository;
import org.example.repositories.JpaRepository;
import org.example.repositories.TrackRepository;

public class Main {
    public static void main(String[] args) {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("oracle");
            EntityManager entityManager = entityManagerFactory.createEntityManager();

            var artistRepository = new ArtistRepository(entityManager);
            var trackRepository = new TrackRepository(entityManager);

            var artista = artistRepository.findById(1);
            System.out.println(artista.toString());

            var musicas = trackRepository.findTracksByArtistId(artista.getId());
            for (var musica:
                    artista.getTracks()//musicas
            ) {
                System.out.println(musica);
            }

            entityManager.close();
            entityManagerFactory.close();
        } catch (Exception e) {
            throw e;
        }
    }
}