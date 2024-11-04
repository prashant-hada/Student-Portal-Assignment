# Student-Portal-Assignment

This backend system supports a multi-step student registration flow designed for an immigration consultancy website. It handles student profiles, educational qualifications, test scores, and other essential data required to assist students seeking opportunities abroad. This repository includes an Entity Relationship Diagram (ERD) and schema design built with Prisma and PostgreSQL.

## Setup Instructions
Follow these steps to set up the project locally:
#### 1. **Clone the Repository**:

    git clone https://github.com/prashant-hada/Student-Portal-Assignment.git
    cd Student-Portal-Assignment

#### 2. **Install Dependencies**: 
Ensure you have Node.js and npm installed. Then run:

    npm install

#### 3. **Set Up Environment Variables**: 
Create a `.env` file in the root directory of the project and add your PostgreSQL database URL:

    DATABASE_URL="postgresql://USER:PASSWORD@HOST:PORT/DATABASE"

#### 4. **Run Migrations**: 
Use Prisma to create the database schema:

    npx prisma migrate dev --name init

#### 5. **Start the Development Server**: 
Start your application using:

    npm start

## Entity Relationship Diagram (ERD) and Schema Design
![ER Diagram Image](https://github.com/prashant-hada/Student-Portal-Assignment/blob/main/ER%20Diagram/assignmentERD.jpg?raw=true)

The backend architecture is organized to capture core aspects of the registration process, with entities connected to represent the relationships between student information, educational background, test scores, and documentation. Key entities include:

-   **Student**: Stores personal details and manages relationships with related tables for address, academic information, education, application status, and document uploads.
-   **Address**: Captures the country, state, city and pin code, supporting a one-to-one relationship with each student.
-   **AcademicInfo**: Records the student’s preferred country, English test type, and score, connected to the Student.
-   **Education**: Tracks each educational qualification, with fields for qualification level, institution, percentage, passing date and country. Each student can have multiple records here.
-   **ApplicationStatus**: Stores visa rejection status for tracking application progress.
-   **StudentDocuments**: Manages different types of required documents for each student, with categories for various certification and identity documents.

## Schema Highlights

-   **Primary Keys & Foreign Keys**: Each model includes a unique `id` field, with foreign keys linking child tables to the `Student` entity.
-   **Data Validation**: Constraints like `NOT NULL`, `UNIQUE` (for `email` and `studentId` fields), and enums (e.g., `MaritalStatus`, `Country`) are used to enforce data integrity.
-   **Indexing**: Indexes are applied on `studentId` and `email` fields to improve query performance for frequent lookups.

## Assumptions and Data Constraints

-   **Single Passport Assumption**: Each student currently has a single passport record, though this can be extended to support multiple passports if needed.
-   **Enum Constraints**: Specific enums for `MaritalStatus`, `Gender`, `Country`, `EnglishTest`, and `DocumentCategory` ensure standardized data entry.
-   **Address and AcademicInfo as Optional**: While a student **may initially lack** an address or academic record, these relationships are configured as optional and can be added as the registration progresses.
-   **Possibility of more that one address**: As per the registration flow the User currently can give a single address. However, there can be a future scenario where a student can have multiple addresses, thus creating a separate entity and relation, helps not only in maintaining current **one-to-one** relationship, but also caters the flexibility to move to **one-to-many** relationship as well. 
-    **Application Status Assumption**: Here I have assumed that the visa rejection status data in the context of application status of student.

## How the Schema Supports the Registration Process

This schema allows the system to handle complex multi-step registration, providing structured storage for each phase:

1.  **Personal Information**: Captured in the `Student` and `Address` tables, storing necessary personal and contact details.
2.  **Educational Background**: Stored in `Education`, enabling multiple qualifications per student.
3.  **Academic and Application Status**: Managed via `AcademicInfo` and `ApplicationStatus` to track academic interests, test scores, and visa application outcomes.
4.  **Document Management**: The `StudentDocuments` table categorizes and stores files, supporting a streamlined document upload and retrieval process.

## Conclusion

This project provides a backend solution for a student registration system, focusing on the schema design and ERD to ensure efficient management of student data. Feedback and contributions are welcome.