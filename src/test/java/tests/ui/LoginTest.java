package tests.ui;

import org.junit.jupiter.api.Test;
import pages.LoginPage;
import utils.TestBase;

public class LoginTest extends TestBase {

    @Test
    public void testValidLogin() {
        page.navigate("https://automationexercise.com/login");
        LoginPage loginPage = new LoginPage(page);
        loginPage.login("test.automation@gmail.com", "test1234");
    }
}
