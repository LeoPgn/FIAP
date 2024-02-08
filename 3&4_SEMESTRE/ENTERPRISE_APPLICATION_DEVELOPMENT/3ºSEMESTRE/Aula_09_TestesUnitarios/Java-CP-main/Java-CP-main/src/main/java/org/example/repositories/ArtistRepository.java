package org.example.repositories;

import jakarta.persistence.EntityManager;
import org.example.models.Artist;
import org.example.models.Track;

import java.util.List;
import java.util.Optional;

public class ArtistRepository extends JpaRepository<Artist>{
    public ArtistRepository(EntityManager entityManager) {
        super(entityManager, Artist.class);
    }

    public Optional<Artist> findByName(String Name){
        var jpql = "SELECT a FROM Artist a WHERE artist_name LIKE :name";
        return Optional.ofNullable(entityManager.createQuery(jpql, Artist.class)
                .setParameter("name", "%"+Name+"%")
                .getSingleResult());
    }

    public List<Artist> getArtistsByType(String type){
        var jpql = "SELECT a FROM Artist a WHERE artist_type = :type";
        return entityManager.createQuery(jpql, Artist.class)
                .setParameter("type", type)
                .getResultList();
    }
}
