// UserApiTest.java - Test class for REST API
package com;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.core.WireMockConfiguration;
import org.junit.jupiter.api.AfterAll;

import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Test class for testing the User API using REST Assured and WireMock.
 * This class sets up a WireMock server to simulate the /api/users endpoint,
 * and contains tests for verifying the status code, response structure,
 * and response data.
 */
public class UserApiTest {

    private static WireMockServer wireMockServer;

    /**
     * Sets up the WireMock server with a stub for the /api/users endpoint.
     * This method runs once before all tests.
     */
    @BeforeAll
    public static void setup() {
        // Automatically assign an available port for WireMock
        wireMockServer = new WireMockServer(WireMockConfiguration.wireMockConfig().dynamicPort());
        wireMockServer.start();

        // Get the actual port WireMock is using and set RestAssured to use it
        int port = wireMockServer.port();
        RestAssured.baseURI = "http://localhost";
        RestAssured.port = port;

        // Configure a sample stub for the /api/users endpoint
        wireMockServer.stubFor(get(urlEqualTo("/api/users"))
                .willReturn(aResponse()
                        .withHeader("Content-Type", "application/json")
                        .withBody("[{\"id\": 1, \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}]")
                        .withStatus(200)));
    }

    /**
     * Stops the WireMock server after all tests have completed.
     */
    @AfterAll
    public static void teardown() {
        if (wireMockServer != null) {
            wireMockServer.stop();
        }
    }

    /**
     * Test to verify that the /api/users endpoint returns a 200 status code.
     */
    @Test
    public void testGetUsersStatusCode() {
        given()
                .when()
                .get("/api/users")
                .then()
                .statusCode(200);
    }

    /**
     * Test to verify that the /api/users endpoint returns the expected JSON structure.
     */
    @Test
    public void testGetUsersResponseStructure() {
        given()
                .when()
                .get("/api/users")
                .then()
                .contentType(ContentType.JSON)
                .body("[0].id", notNullValue())
                .body("[0].name", notNullValue())
                .body("[0].email", notNullValue());
    }

    /**
     * Test to validate specific data values from the /api/users endpoint.
     * This test ensures that the response contains the expected user information.
     */
    @Test
    public void testGetUsersResponseData() {
        Response response = given()
                .when()
                .get("/api/users")
                .then()
                .extract()
                .response();

        int id = response.path("[0].id");
        String name = response.path("[0].name");
        String email = response.path("[0].email");

        // Assertions to verify the response contains the correct data
        assertEquals(1, id);
        assertEquals("John Doe", name);
        assertEquals("john.doe@example.com", email);
    }
}
