package org.example.repositories;

import jakarta.persistence.EntityManager;
import org.example.models.Artist;
import org.example.models.Track;

import java.util.List;
import java.util.Optional;

public class TrackRepository {

    private EntityManager entityManager;

    public TrackRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Iterable<Track> findAllTrack() {
        String jpql = "SELECT a FROM Track a";
        var query = entityManager.createQuery(jpql, Track.class);
        var tracks = query.getResultList();
        return tracks;
    }

    public Optional<Track> findByName(String Name){
        var jpql = "SELECT t FROM Track t WHERE name LIKE :name";
        return Optional.ofNullable(entityManager.createQuery("%"+jpql+"%", Track.class)
                .setParameter("name", Name)
                .getSingleResult());
    }

    public Track findTrackById(int id) {
        Track track = entityManager.find(Track.class, id);
        if (track == null) {
            return null;
        }
        return track;
    }

    public List<Track> findTracksByArtistId(Long artistId){
        var jpql = "SELECT t FROM Track t JOIN t.artist a WHERE a.Id = :id";
        return entityManager.createQuery(jpql, Track.class)
                .setParameter("id", artistId)
                .getResultList();
    }

    public void insertTrack(Track track) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(track);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }

    public void updateTrack(Track track) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(track);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }

    public void deleteTrackById(int id) {
        Track track = entityManager.find(Track.class, id);
        entityManager.getTransaction().begin();
        try {
            if (track != null) {
                entityManager.remove(track);
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }
}
