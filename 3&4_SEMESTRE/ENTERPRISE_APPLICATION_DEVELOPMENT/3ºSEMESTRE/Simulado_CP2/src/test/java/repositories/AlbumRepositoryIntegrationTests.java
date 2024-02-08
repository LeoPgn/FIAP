package repositories;

import com.github.javafaker.Faker;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.models.Album;
import org.example.repositories.AlbumRepository;
import org.example.repositories.ArtistRepository;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import java.util.Random;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class AlbumRepositoryIntegrationTests {

    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static AlbumRepository albumRepository;
    private static ArtistRepository artistRepository;
    private final Faker faker = new Faker();


    @BeforeAll
    public static void setUp(){
        entityManagerFactory = Persistence.createEntityManagerFactory("postgres");
        entityManager = entityManagerFactory.createEntityManager();
        albumRepository = new AlbumRepository(entityManager);
        artistRepository = new ArtistRepository(entityManager);
    }

    @Test
    @Order(1)
    public void testCreateValidAlbum(){
        //Arrange
        var album = new Album();
        album.setAlbum_name(faker.lorem().word());
        album.setAlbum_recorded(faker.date().past(10000, TimeUnit.DAYS));
        album.setAlbum_released(faker.date().past(5000, TimeUnit.DAYS));
        album.setArtist(artistRepository.findById(1));

        //Act
        albumRepository.InsertAlbum(album);

        //Asserts
        var savedAlbum = albumRepository.GetAlbumById(album.getId()).orElse(null);
        assertNotNull(savedAlbum);
        assertEquals(album.getAlbum_name(), savedAlbum.getAlbum_name());
    }

    @Test
    @Order(2)
    public void testCreateInvalidAlbum(){
        //Arrange
        var album = new Album();

        //Act
        try {
            albumRepository.InsertAlbum(album);
        }
        catch (Exception e)
        {
            //Assert
            assertNotNull(e);
        }
    }

    @Test
    @Order(3)
    public void testUpdateAlbum()
    {
        //Arrange
        var album = new Album();
        album.setAlbum_name(faker.lorem().word());
        album.setAlbum_recorded(faker.date().past(10000, TimeUnit.DAYS));
        album.setAlbum_released(faker.date().past(5000, TimeUnit.DAYS));
        album.setArtist(artistRepository.findById(1));

        albumRepository.InsertAlbum(album);

        album.setAlbum_name(faker.lorem().word());
        album.setAlbum_recorded(faker.date().past(10000, TimeUnit.DAYS));
        album.setAlbum_released(faker.date().past(5000, TimeUnit.DAYS));
        album.setArtist(artistRepository.findById(2));

        //Act
        albumRepository.updateAlbum(album);

        //Asserts
        var updatedAlbum = albumRepository.GetAlbumById(album.getId()).orElse(null);
        assertNotNull(updatedAlbum);
        assertEquals(album.getAlbum_name(), updatedAlbum.getAlbum_name());
        assertEquals(album.getAlbum_recorded(), updatedAlbum.getAlbum_recorded());
        assertEquals(album.getArtist(), updatedAlbum.getArtist());
    }

    @Test
    @Order(4)
    public void testUpdateAlbumInvalid()
    {
        //Arrange
        var album = new Album();
        album.setAlbum_name(faker.lorem().word());
        album.setAlbum_recorded(faker.date().past(10000, TimeUnit.DAYS));
        album.setAlbum_released(faker.date().past(5000, TimeUnit.DAYS));
        album.setArtist(artistRepository.findById(1));

        albumRepository.InsertAlbum(album);

        album.setAlbum_name(null);
        album.setAlbum_recorded(faker.date().past(10000, TimeUnit.DAYS));
        album.setAlbum_released(faker.date().past(5000, TimeUnit.DAYS));
        album.setArtist(artistRepository.findById(2));

        try {
            //Act
            albumRepository.updateAlbum(album);
        }
        catch (Exception e) {
            //Asserts
            assertNotNull(e);
        }
    }

    @AfterAll
    public static void tearDown(){
        entityManager.close();
        entityManagerFactory.close();
    }
}
