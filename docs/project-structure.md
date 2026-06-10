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

## Inspecting Model Attributes

Rails models do not explicitly declare database fields. Active Record discovers them from the database schema and generates accessor methods automatically.

For example, the `Comment` model does not define attributes such as `commenter`, `body`, or `status` in `app/models/comment.rb`:

```ruby
class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  def ydob
    body.reverse
  end
end
```

```shell
bin/rails console
Comment.column_names
```

### Where are model fields defined?

Useful references:

- `db/schema.rb` → current database structure
- `Comment.column_names` → current model attributes
- `Comment.attribute_names` → available attributes on the model
