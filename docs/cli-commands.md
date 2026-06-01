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

---

## Generate a Model

Generates an ActiveRecord model, its corresponding database migration file, fixtures, and unit test suites.

- **Arguments:** `Article` (Model Name), `title:string body:text` (Database Schema Fields).

```bash
bin/rails generate model Article title:string body:text
```

```text
invoke  active_record
create    db/migrate/20260601001655_create_articles.rb
create    app/models/article.rb
invoke    test_unit
create      test/models/article_test.rb
create      test/fixtures/articles.yml
```

## Generate a Scaffold (Scaffolding)

An all-in-one generator that builds the entire MVC stack (Model, Migration, Controller, RESTful Views, and comprehensive Test Suites).

```bash
bin/rails generate scaffold Article title:string body:text
```

## Database Management

### Run Pending Migrations

Executes outstanding database migration files against the target database schema to synchronize the data layer.

```bash
bin/rails db:migrate
```

## Interactive Console

### Start the Rails Console

Launches an interactive Ruby shell (IRB) preloaded with the Rails application environment, enabling direct interaction with models and the database.

```bash
bin/rails console
```

_Alternative short command:_ `bin/rails c`

### Basic ActiveRecord Operations (CRUD) inside the Console

Once inside the console environment (`irb>`), you can interact with your models using the following API patterns:

- Instantiate a new record:

```bash
irb> article = Article.new(title: "Hello Rails", body: "I am on Rails!")
```

- Persist the record to the database:

```bash
irb> article.save
```

- Find a record by its primary key (ID):

```bash
irb> Article.find(1)
```

- Retrieve all records from the collection:

```bash
irb> Article.all
```
