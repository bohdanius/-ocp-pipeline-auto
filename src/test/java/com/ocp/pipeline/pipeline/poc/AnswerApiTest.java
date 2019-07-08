package com.ocp.pipeline.pipeline.poc;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.Before;
import org.junit.Test;

import static org.hamcrest.Matchers.is;
import static io.restassured.RestAssured.*;

public class AnswerApiTest {
    @Before
    public void setup() {
        RestAssured.baseURI = System.getProperty("server.host", DEFAULT_URI);
        RestAssured.port = Integer.valueOf(System.getProperty("server.port", "8080"));
    }

    @Test
    public void shouldReturnPersonForTheId() {
        given().
                accept(ContentType.JSON).
                when().
                get("/answer").
                then().
                statusCode(200).
                body(
                        is("42")
                );
    }
}
