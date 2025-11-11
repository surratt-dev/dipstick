-- Initialize Engineering Health Check Tool Databases
-- This script runs automatically when the PostgreSQL container is first created

-- Create test database (in addition to the main dipstick_dev database)
CREATE DATABASE dipstick_test OWNER dipstick_user;

-- Grant all privileges
GRANT ALL PRIVILEGES ON DATABASE dipstick_dev TO dipstick_user;
GRANT ALL PRIVILEGES ON DATABASE dipstick_test TO dipstick_user;

-- Connect to main database and create extensions
\c dipstick_dev;

-- Enable UUID extension for generating UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Enable pgcrypto for encryption functions
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Create initial schema (tables will be created by migrations)
CREATE SCHEMA IF NOT EXISTS public;
GRANT ALL ON SCHEMA public TO dipstick_user;

-- Connect to test database and set up extensions
\c dipstick_test;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE SCHEMA IF NOT EXISTS public;
GRANT ALL ON SCHEMA public TO dipstick_user;

-- Log completion
\c dipstick_dev;
SELECT 'Database initialization completed successfully' AS status;
