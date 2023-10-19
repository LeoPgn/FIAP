package org.example.repositories;


import jakarta.persistence.EntityManager;
import org.example.models.Driver;

import java.util.List;
import java.util.Optional;

public class DriverRepository {

    EntityManager entityManager;

    public DriverRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Driver> GetAllDriver(){
        var jqpl = "SELECT a FROM Driver a";
        var query = entityManager.createQuery(jqpl,Driver.class);
        return query.getResultList();
    }

    public Optional<Driver> GetDriverById(long id){
        return Optional.ofNullable(entityManager.find(Driver.class,id));
    }

    public void InsertDriver(Driver driver) {
        try{
            entityManager.getTransaction().begin();
            entityManager.persist(driver);
            entityManager.getTransaction().commit();
        }
        catch (Exception e)
        {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }

    public void updateDriver(Driver driver)
    {
        try{
            entityManager.getTransaction().begin();
            entityManager.merge(driver);
            entityManager.getTransaction().commit();
        }
        catch (Exception e)
        {
            entityManager.getTransaction().rollback();
            throw e;
        }
    }

    public void deleteDriver(long id)
    {
        try{
            var driver = GetDriverById(id);
            if(driver.isPresent()) {
                entityManager.getTransaction().begin();
                entityManager.remove(driver);
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
