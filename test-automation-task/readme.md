
# Java API Test Application

## Overview
This project demonstrates how to test REST APIs using REST Assured and WireMock in a Java-based environment. 
The primary goal is to verify the `/api/users` endpoint, including its response status, structure, and data. 
The project utilizes JUnit 5 for unit testing and includes detailed comments to enhance understanding.

## Project Structure
- **App.java**: The main application entry point, serving as a placeholder to run the Java API test application.
- **UserApiTest.java**: A test class that verifies the behavior of the `/api/users` endpoint using REST Assured and WireMock.
- **README.md**: Documentation of the project, including setup instructions and usage.

## Dependencies
The following dependencies are used in the project:
- **JUnit 5**: A widely-used testing framework for Java, providing structure for organizing and running tests.
- **REST Assured**: A Java library for testing REST APIs, allowing for easy validation of HTTP responses.
- **WireMock**: A tool to mock HTTP APIs, enabling reliable tests by simulating the `/api/users` endpoint independently of real backend services.

## Setup Instructions

### Prerequisites
Ensure the following are installed:
- **Java 17**: Verify the installation with:
  ```bash
  java -version
  ```
- **Maven**: Required to build the project and manage dependencies. Verify the installation with:
  ```bash
  mvn -version
  ```
- **Postman** (Optional): Useful for manual testing of the API.

### Installation
1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd test-project-ehb/test-automation-task
   ```
   Alternatively, download the **test-automation-task** folder directly from GitHub by navigating to it and clicking on **Download ZIP**.

2. **Build the Project**
   Use Maven to clean and build the project:
   ```bash
   mvn clean install
   ```

## Running the Tests
To run automated tests for the `/api/users` endpoint, use:
```bash
mvn test
```

### Test Cases Overview
- **`testGetUsersStatusCode`**: Verifies that the `/api/users` endpoint returns a `200 OK` status code.
- **`testGetUsersResponseStructure`**: Ensures the response contains the expected JSON structure, including `id`, `name`, and `email` fields.
- **`testGetUsersResponseData`**: Validates the response data, such as confirming the presence of `John Doe`.

## Testing Approach
This project simulates realistic API responses while keeping tests isolated from real backend services.

- **WireMock**: Mocks the `/api/users` endpoint to avoid reliance on a real server. Ensures consistent and reproducible tests.
- **REST Assured**: Sends HTTP requests and validates responses, ensuring the structure and content match expectations.

### Mocking with WireMock
- The WireMock server starts before the tests (`@BeforeAll`) and stops afterward (`@AfterAll`).
- A stub is set up to respond to requests at `/api/users` with a predefined JSON response.

## How to Run the Application
If you need to run the main application (`App.java`), use:
```bash
mvn exec:java -Dexec.mainClass="com.App"
```

## File Overview
- **`src/main/java/com/App.java`**: The main class, serving as a placeholder to start the Java API Test Application.
- **`src/test/java/com/UserApiTest.java`**: Contains the test cases for the `/api/users` endpoint using REST Assured and WireMock.

## Notes
- **Documentation**: All classes and methods contain clear comments explaining their purpose and behavior.
- **Environment**: The project runs locally on `http://localhost`, and WireMock binds to an available port dynamically.

## Future Improvements
- Expand test coverage to include additional endpoints and negative test cases (e.g., `404 Not Found`, `400 Bad Request`).
- Implement parameterized tests to reduce redundancy.