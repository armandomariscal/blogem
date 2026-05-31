# Project Directory Structure

A filtered blueprint of the codebase architecture to trace component locations.

## Directory Tree Mapping

Execute the following utility command to generate this clean view:
`tree -I "log|tmp|storage|node_modules|vendor/bundle|public/assets|.git"`

```text
.
├── App/
│   ├── Controllers/      # App Orchestrators (Handles Request/Response lifecycle)
│   ├── Helpers/          # View Helpers (UI formatting logic)
│   ├── Models/           # Data & Business Logic (Interfaces with DB)
│   └── Views/            # Templates / User Interface (HTML.erb layout contexts)
│       └── Articles/     # Specific view templates for the Articles component
├── Config/
│   ├── Application.rb    # Global framework configurations
│   ├── Environments/     # Environment-specific settings (development, production)
│   └── Routes.rb         # URL Router (Maps incoming requests to Controllers)
├── Db/
│   ├── Migrate/          # Database Schema Migrations changelog
│   └── Seeds.rb          # Initial seed data for the database
├── Test/
│   ├── Controllers/      # Controller integration test suites
│   ├── Models/           # Model unit test validations
│   └── System/           # End-to-End browser simulation tests
├── Gemfile               # Project dependency manifest (Ruby Gems)
└── Gemfile.lock          # Cryptographic breakdown of installed dependency versions
```

## Ignored Paths Reference

The following directories are explicitly omitted from standard architecture scans to prevent noise:

- `log/` & `tmp/` - Transient runtime application states and logs.

- `storage/` - Active Storage binaries and local SQLite raw databases.

- `vendor/bundle/` - Local isolated runtime environment dependencies.
