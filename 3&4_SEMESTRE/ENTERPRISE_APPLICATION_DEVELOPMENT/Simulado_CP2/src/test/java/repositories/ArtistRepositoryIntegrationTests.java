package repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.models.Artist;
import org.example.repositories.ArtistRepository;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class ArtistRepositoryIntegrationTests {

    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static ArtistRepository artistRepository;

    @BeforeAll
    public static void setUp(){
        //Prepara o entity manager factory corretamente para apontar para o banco certo
        entityManagerFactory = Persistence.createEntityManagerFactory("postgres");
        //Cria o entityManager para gerenciar as entidades
        entityManager = entityManagerFactory.createEntityManager();
        //Instancia a classe de repositorio
        artistRepository = new ArtistRepository(entityManager);
    }

    @Test
    @Order(1)
    public void verifyLoad(){
        //Act
        var artists = artistRepository.getAll();

        //Asserts
        assertFalse(artists.size() < 3);
    }

    @Test
    @Order(2)
    public void saveArtist(){
        //Arrange
        var artista = new Artist("Coldplay", "Rock/Pop",
                null, null, null);

        //Act
        artistRepository.create(artista);

        //Asserts
        var artistaInserido = artistRepository.findById(artista.getId());
        assertNotNull(artistaInserido);
        assertEquals(artista.getArtist_name(), artistaInserido.getArtist_name());
    }

    @Test
    @Order(3)
    public void updateArtist(){
        //Arrange
        var artista = artistRepository.findById(1);
        artista.setArtist_name("The Weekend");
        artista.setArtist_type("Pop/Rock");

        //Act
        artistRepository.update(artista);
        var artistaAtualizado = artistRepository.findById(1);

        //Assert
        assertNotNull(artistaAtualizado);
        assertEquals(artista.getArtist_name(), artistaAtualizado.getArtist_name());
    }

    @Test
    @Order(4)
    public void getArtistByName(){
        //Arrange
        var artista = new Artist("Imagine Dragons", "Rock/Pop",
                null, null, null);

        //Act
        artistRepository.create(artista);
        var artistaInserido = artistRepository.findByName("Imagine Dragons");

        //Assert
        assert artistaInserido.isPresent();
        assertEquals(artista.getArtist_name(), artistaInserido.get().getArtist_name());
    }

    @Test
    @Order(5)
    public void getMusicasByArtist(){
        //Arrange
        var artista = artistRepository.findById(1);

        //Act
        var musicas = artista.getTracks();

        //Arrange
        assertNotNull(musicas);
        assertFalse(musicas.isEmpty());
    }

    @AfterAll
    public static void tearDown(){
        entityManager.close();
        entityManagerFactory.close();
    }
}
