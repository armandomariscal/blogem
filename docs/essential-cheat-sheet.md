# Essential Rails Cheat Sheet

A curated reference guide of indispensable commands for everyday development, debugging, dependency management, and database synchronization.

## Database Utilities & Recovery

### Drop, Create, and Re-migrate from Scratch

Destroys the existing local database, recreates it, and runs all migrations. Extremely useful when you want a clean slate or need to fix structural testing bugs.

```bash
bin/rails db:reset
```

### Completely Destroy and Rebuild (Hard Reset)

Drops the database, creates it, loads the schema structure directly, and runs the seed file. Faster than db:reset because it bypasses running individual migration files step-by-step.

```bash
bin/rails db:migrate:reset
```

### Seed the Database

Populates the database with initial or mock data defined inside the db/seeds.rb file.

```bash
bin/rails db:seed
```

### Check Migration Status

Displays an audit log of all migrations, showing whether they are currently applied (up) or pending (down), alongside their unique timestamp ID.

```bash
bin/rails db:migrate:status
```

### Rollback the Last Migration

Reverts the very last migration applied to the database schema.

```bash
bin/rails db:rollback
```

- Targeted Rollback: Revert a specific number of migrations by appending a step argument: bin/rails db:rollback STEP=3

---

## Code Generation Cleanup

### Destroy/Undo a Generator

Completely rolls back and deletes all files created by a specific generator (models, controllers, scaffolds, helpers). It acts as the exact inverse function of bin/rails generate.

```bash
bin/rails destroy model Article
bin/rails destroy controller Articles
```

---

## Dependency & Environment Management

### Clean Local System Cache

Clears transient files, session logs, webpacked assets, and server cache buffers to resolve unexpected environment states.

```bash
bin/rails dev:cache
bin/rails tmp:clear
bin/rails log:clear
```

### Install Project Dependencies

Fetches, locks, and installs all Ruby gems declared in the Gemfile.

```bash
bundle install
```

### Update Specific Gems

Updates a singular package to its latest safe version without touching the rest of the ecosystem.

```bash
bundle update image_processing
```

---

## Testing & Code Quality

### Run the Full Test Suite

Executes all unit, functional, integration, and system test files configured under the test/ directory.

```bash
bin/rails test
```

### Target a Single Test File

Isolates a unique model or controller file to speed up execution feedback loops.

```bash
bin/rails test test/models/article_test.rb
```

### Run a Specific Test Case Line

Runs a single test definition block matching a precise line number in the source file.

```bash
bin/rails test test/models/article_test.rb:14
```

---

## Active Record Console Advanced Use

### Launch Console in Sandbox Mode

Opens the standard interactive environment but wraps every transaction in a database rollback. Any records created, updated, or destroyed will be completely wiped out once you exit the terminal session.

```bash
bin/rails console --sandbox
```

Alternative short command: `bin/rails c -s`
