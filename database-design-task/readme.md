# Books and Authors Database Schema Setup - README

## Overview
This README provides a comprehensive overview of the relational database schema designed to store information about books and authors. The database structure is implemented using SQL DDL (Data Definition Language) to define the required tables and establish relationships between them.

## Requirements
- Include tables for **Books** and **Authors**.
- Provide appropriate **foreign key relationships** between the tables.
- The schema must be presented in **SQL DDL** format.

## Schema Overview
The relational database schema consists of three tables: `Books`, `Authors`, and `BookAuthors`. This structure helps represent the **many-to-many relationship** between books and authors, as a book can have multiple authors, and an author can write multiple books.

### Tables
1. **Authors Table**
    - Stores information about authors.
    - **AuthorID**: Unique identifier for each author, automatically incremented.
    - **Name**: The name of the author.

2. **Books Table**
    - Stores information about books.
    - **BookID**: Unique identifier for each book, automatically incremented.
    - **Title**: The title of the book.
    - **PublicationYear**: The year in which the book was published.

3. **BookAuthors Table**
    - Represents the relationship between books and authors.
    - **BookID** and **AuthorID** together form a composite primary key.
    - Establishes **foreign key relationships** with both the `Books` and `Authors` tables.

## Relationships
- **Books and Authors Relationship**: There is a many-to-many relationship between books and authors. The `BookAuthors` table is used to capture this relationship by linking `BookID` from the `Books` table and `AuthorID` from the `Authors` table.

- **Foreign Keys**: 
  - The **BookID** in the `BookAuthors` table is a foreign key that references the **BookID** in the `Books` table, ensuring each entry in `BookAuthors` is associated with a valid book.
  - Similarly, **AuthorID** in the `BookAuthors` table is a foreign key referencing **AuthorID** in the `Authors` table, ensuring valid author information.
