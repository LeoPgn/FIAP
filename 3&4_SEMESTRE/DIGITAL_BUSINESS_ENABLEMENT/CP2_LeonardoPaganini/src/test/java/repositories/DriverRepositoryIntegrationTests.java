package repositories;

import com.github.javafaker.Faker;
import org.example.models.Driver;
import org.example.repositories.DriverRepository;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class DriverRepositoryIntegrationTest {
    @Test
    public void testSaveAndFindById() {
        Driver driver = new Driver();
        driver.setDriverName(Faker.lorem.word());
        driver.setDriverAdd(Faker.lorem.word());
        driver.setDriverEmail(Faker.lorem.word());
        driver.setDriverContactNo(Faker.lorem.words());

        DriverRepository driverRepository = new DriverRepository();
        driverRepository.save(driver);

        Driver retrievedDriver = driverRepository.findById(driver.getDriverID());
        assertEquals(driver, retrievedDriver);
    }
}