# Users and Orders Database Schema Setup - README

## Overview
This README provides step-by-step instructions for creating and setting up a simple relational database schema for `Users` and `Orders` tables, inserting sample data, and verifying that the data aligns with the requirements of the assessment task.

## Prerequisites

- **MySQL Workbench**: To interact with MySQL databases. 
  - **Version**: MySQL Workbench 8.0 or later is recommended.
- **Docker**: You may set up MySQL in Docker for an isolated environment. 
  - **Version**: Docker Desktop 4.0 or later is recommended.
  - **Operating Systems**: 
    - **macOS**: Version 10.15 (Catalina) or later.
    - **Windows**: Version 10 or later.

## Step 1: Docker Setup for MySQL

   1. **Install Docker**: [Docker's official website](https://www.docker.com/get-started).

   2. **Pull MySQL Docker Image**: Run the following command to pull the MySQL Docker image:
      ```sh
      docker pull mysql:latest
      ```
   3. **Run MySQL Container**: Start a new MySQL container with the following command:
      ```sh
      docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=root -d -p 3306:3306 mysql:latest
      ```
      - **--name mysql-container**: Names the container for easier reference.
      - **-e MYSQL_ROOT_PASSWORD=root**: Sets the root password for MySQL.
      - **-d**: Runs the container in detached mode.
      - **-p 3306:3306**: Maps port 3306 of the container to port 3306 on your host machine.

   4. **Verify the Container is Running**: Run the following command to check if the container is running:
      ```sh
      docker ps
      ```

   5. **Connect MySQL Workbench to Docker MySQL**:
      - Open **MySQL Workbench**.
      - Click on **+** to add a new connection.
      - Set **Connection Name** to anything you prefer (e.g., `Docker MySQL`).
      - **Hostname**: Set to `127.0.0.1`.
      - **Port**: Set to `3306`.
      - **Username**: Set to `root`.
      - **Password**: Set to the password you used (`root`).
      - Click **Test Connection** to verify that everything is working.
      - Click **Save** to save the connection.

## Step 2: Create a New Schema in MySQL Workbench

   1. **Open MySQL Workbench** and connect to your server.

   2. **Create a new schema**:
      - Right-click on the **Schemas** panel and select **Create Schema**.
      - Enter the **Schema Name** (e.g., `task_test`).
      - Set the **Character Set** to `utf8mb4` (default).
      - Set the **Collation** to `utf8mb4_general_ci` (default).
      - Click **Apply** to create the schema.

   3. **Set the schema to active** by right-clicking on the new schema and selecting **Set as Default Schema**.

## Step 2: Create Tables (`Users` and `Orders`)

## Step 3: Insert Sample Data into Tables

## Step 4: Verify Data in the Tables

   1. **Verify the Data in `Users` Table**:
      ```sql
      SELECT * FROM Users;
      ```
      - Verify that the `Users` table contains all five users with accurate data.

   2. **Verify the Data in `Orders` Table**:
      ```sql
      SELECT * FROM Orders;
      ```
      - Ensure that each order is correctly linked to an existing user and that the dates are as expected.

   3. **Combined Query** (to join both tables and see order-user relationships):
      ```sql
      SELECT u.UserID, u.Name, o.OrderID, o.OrderDate
      FROM Users u
      JOIN Orders o ON u.UserID = o.UserID;
      ```
      - This will display all orders along with the corresponding user information.