# Admin Panel

## Description
 It uses Node.js with Express, Sequelize, PostgreSQL, and other libraries.

## Prerequisites
- Node.js (v14 or higher recommended)
- PostgreSQL database

## Installation

1. Clone the repository or unzip the project archive.

2. Install dependencies by running:

```npm install```

This will install the following packages:
- bcrypt
- cookie-parser
- csurf
- dotenv
- ejs
- express
- express-ejs-layouts
- express-session
- jsonwebtoken
- pg
- sequelize

## Database Setup
1. Create a PostgreSQL database.

2. Import the provided SQL dump file to create tables and insert test data.

3. Configure database connection in the .env file:

- PORT=your_port
- SESSION_SECRET=your_secret_key
- DB_NAME=admin_panel_db
- DB_USER=your_user
- DB_PASS=your_password
- DB_HOST=your_host
- DB_PORT=your_port

## Running the Application
1. Start the application with the command:
   ```npm start```
2. The server will start and listen on the configured port
3. To enter the Administration panel use login: admin and password: admin123
