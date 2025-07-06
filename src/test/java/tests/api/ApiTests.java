package tests.api;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.hamcrest.Matchers.*;

public class ApiTests {

    @Test
    @Tag("regression")
    public void testLoginEndpoint() {
        Response res = RestAssured
                .given()
                .baseUri("https://automationexercise.com")
                .contentType("application/json")
                .body("{\"username\":\"user1\", \"password\":\"secret\"}")
                .when()
                .get("/login");

        res.then()
                .statusCode(200)
                .body("token", notNullValue());
    }
}
