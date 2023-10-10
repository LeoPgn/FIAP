package repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.junit.jupiter.api.BeforeAll;

public class AlbumRepositoryIntegrationTests {
    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static AlbumRepository albumRepository;

    @BeforeAll
    EntityManagerFactory = Persistence.createEntityManagerFactory("oracle");
    entityManager = entityManagerFactory.createEntityManager();
    albumRepository = new AlbumRepository(entityManager);
}
