# PostgreSQL Database Reference

A comprehensive reference log for managing PostgreSQL databases, executing SQL operations on the blog domain, and configuring server authentications.

## Interactive psql Console Utilities

### Connect to the Application Database

Switches the active psql session context to the blog development database.

```bash
\c blog_development
```

### List All Databases

Displays a detailed list of all existing databases, including their sizes, tablespaces, and encoding formats.

```bash
\l+
```

### List Users and Roles

Shows all database users, roles, and their assigned global privileges.

```bash
\du
```

### Inspect Specific User Attributes

Displays detailed permission maps, groups, and role parameters for a dedicated system user.

```bash
\du blog_user
```

### Grant Database Access Permissions

Assigns explicit connection privileges on the target database to the designated application role.

```sql
GRANT CONNECT ON DATABASE blog_development TO blog_user;
```

### Grant All Schema Privileges

Enables full table creation, modification, and query permissions within the public schema space.

```sql
GRANT ALL PRIVILEGES ON SCHEMA public TO blog_user;
```

### Exit the psql Console

Terminates the interactive PostgreSQL terminal session cleanly.

```bash
\q
```

### Alter User Password

Updates or resets the authentication credentials for a specific database user role.

```sql
ALTER USER blog_user WITH PASSWORD 'secure_blog_pwd_2026';
```

---

## Core DDL & DML SQL Queries (Articles Domain)

### Explicit Table Creation (Raw Schema Reference)

Demonstrates the underlying structural design for storing article components natively in PostgreSQL.

```sql
CREATE TABLE articles (
id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
body TEXT NOT NULL,
metadata JSONB,
created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);
```

### Targeted Record Modification

Appends a development prefix tag to an article title filtering by its unique primary identifier.

```sql
UPDATE articles
SET title = '[DEV] ' || title
WHERE id = 1;
```

### Count Grouped Records

Aggregates total written articles to audit the persistence layer.

```sql
SELECT COUNT(\*) FROM articles;
```

---

## Terminal & Connection Operations

### Authenticate as Application User (Local Network Host)

Establishes a connection to the development database bypassing the superuser role.

```bash
psql -h localhost -U blog_user -d blog_development
```

### Locate the PostgreSQL HBA Configuration File

Asks the server engine to return the exact directory path of pg_hba.conf to inspect client authentication configurations.

```bash
sudo -u postgres psql -c "SHOW hba_file;"
```

### Edit HBA Rules (Host-Based Authentication)

Opens the main network security configuration file to modify connection permissions (e.g., changing peer/ident to md5).

```bash
sudo nano /etc/postgresql/16/main/pg_hba.conf
```

### Modify Postgres Superuser Password

Forces a password update on the root engine administrator to secure external local bridges.

```sql
ALTER USER postgres WITH PASSWORD 'root_postgres_secure';
```

### Connect to Local Host via Raw Command Line

Invokes direct socket connection strings targeting structural users.

```bash
psql -h localhost -U postgres
psql -h localhost -U blog_user
```
