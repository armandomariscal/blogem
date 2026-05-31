# Command Line Interface (CLI) Reference

A historical log of development commands used throughout the project lifecycle.

## Project Initialization

### Create a new Rails application

Generates the baseline directory structure, configuration files, and default dependencies.

```bash
rails new blog
```

## Development Server

### Boot the local server

Starts the Puma web server. By default, the application will be accessible at `http://localhost:3000`.

```bash
bin/rails server
```

_Alternative short command:_ `bin/rails s`

## Code Generators

### Generate a Controller

Creates a specific Controller component along with its corresponding views, helper modules, and test suites.

```bash
bin/rails generate controller Articles index
```

- **Arguments:** `Articles` (Controller Name), `index` (Target Action/Method).
- Tip: Append `--skip-routes` if you intend to declare routes manually in `config/routes.rb`.

## Generate a Scaffold (Scaffolding)

An all-in-one generator that builds the entire MVC stack (Model, Migration, Controller, RESTful Views, and comprehensive Test Suites).

```bash
bin/rails generate scaffold Article title:string body:text
```

- **Arguments:** `Article` (Model Name), `title:string body:text` (Database Schema Fields).

## Utilities

### Inspect Project Directory Tree

Displays a clean visualization of the active directory structure while filtering out transient, dependencies, and environment directories.

```bash
tree -I "log|tmp|storage|node_modules|vendor/bundle|public/assets|.git"
```
