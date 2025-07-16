-- Creating the application's secure user
CREATE USER myappuser WITH PASSWORD 'senha_app_segura';
CREATE DATABASE myappdb;

-- Grant minimum permissions
GRANT CONNECT ON DATABASE myappdb TO myappuser;
\c myappdb
GRANT USAGE ON SCHEMA public TO myappuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO myappuser;
