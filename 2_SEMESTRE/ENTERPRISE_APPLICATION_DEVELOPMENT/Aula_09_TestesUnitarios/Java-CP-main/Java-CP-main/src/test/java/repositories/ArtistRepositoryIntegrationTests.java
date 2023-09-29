package repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.models.Artist;
import org.example.repositories.ArtistRepository;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class ArtistRepositoryIntegrationTests {

    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static ArtistRepository artistRepository;

    @BeforeAll
    public static void setUp(){
        entityManagerFactory = Persistence.createEntityManagerFactory("oracle");
        entityManager = entityManagerFactory.createEntityManager();
        artistRepository = new ArtistRepository(entityManager);
    }

    @Test
    public void saveArtist(){
        var artista = new Artist("Coldplay", "Rock/Pop", null, null, null);

        artistRepository.create(artista);

        var artistaInserido = artistRepository.findById(artista.getId());
        assertNotNull(artistaInserido);
        assertEquals (artista.getArtist_name(), artistaInserido.getArtist_name());

    }

    @Test
    public void updateArtist(){
        var artista = artistRepository.findById(1);
        artista.setArtist_name("The Weeknd");
        artista.setArtist_type("Pop/Rock");
    }
    @Test
    public void getArtist(){
        var artista = new Artist("Imagine Dragons", "Rock/Pop", null, null, null);

        artistRepository.create(artista);
        var artistaInserido = artistRepository.findByName("Imagine Dragons");
        assertNotNull(artistaInserido.isPresent());
        assertEquals (artista.getArtist_name(), artistaInserido.get().getArtist_name());
    }

    @AfterAll
    public static void tearDown(){
        entityManager.close();
        entityManagerFactory.close();
    }




}
