import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import java.net.URL;
import org.testng.annotations.Test;
import org.openqa.selenium.Platform;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

public class GridExample {

    private RemoteWebDriver driver = null;

    @BeforeMethod(alwaysRun = true)
    public void setupBaseTest() throws Exception {
        DesiredCapabilities dr = null;
        dr = DesiredCapabilities.chrome();
        driver = new RemoteWebDriver(new URL("http://34.254.183.221:4444/wd/hub"), dr);
    }

    @AfterMethod(alwaysRun = true)
    public void tearDown() throws Exception {
        driver.quit();
    }
    
    @Test
    public void firstTest() throws Exception {
        driver.get("http://google.com");
        System.out.println(driver.getTitle());
    }
}