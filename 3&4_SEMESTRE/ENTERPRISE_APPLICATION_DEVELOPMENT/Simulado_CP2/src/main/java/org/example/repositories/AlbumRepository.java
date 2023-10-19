package org.example.repositories;

import jakarta.persistence.EntityManager;
import org.example.models.Album;

import java.util.List;
import java.util.Optional;

public class AlbumRepository {

    EntityManager entityManager;

    public AlbumRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Album> GetAllAlbuns(){
        var jqpl = "SELECT a FROM Album a";//Lembrem do Alias {a}
        var query = entityManager.createQuery(jqpl,Album.class);
        return query.getResultList();
    }

    public Optional<Album> GetAlbumById(long id){
        return Optional.ofNullable(entityManager.find(Album.class,id));
    }

    public void InsertAlbum(Album album)
    {
        try{
            entityManager.getTransaction().begin();
            entityManager.persist(album);
            entityManager.getTransaction().commit();
        }
        catch (Exception e)
        {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }

    public void updateAlbum(Album album)
    {
        try{
            entityManager.getTransaction().begin();
            entityManager.merge(album);
            entityManager.getTransaction().commit();
        }
        catch (Exception e)
        {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }

    public void deleteAlbum(long id)
    {
        try{
            var album = GetAlbumById(id);
            if(album.isPresent()) {
                entityManager.getTransaction().begin();
                entityManager.remove(album);
                entityManager.getTransaction().commit();
            }
        }
        catch (Exception e)
        {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }
}
