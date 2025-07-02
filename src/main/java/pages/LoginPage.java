package pages;

import com.microsoft.playwright.Page;

public class LoginPage {
    private final Page page;

    public LoginPage(Page page) {
        this.page = page;
    }

    public void login(String email, String password) {
        page.fill("[name=\"email\"]", email);
        page.fill("[name=\"password\"]", password);
        page.click("[type=\"submit\"]");
    }
}
