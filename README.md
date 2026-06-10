# Blog

Simple blog application built with Ruby on Rails 8 using the modern default Rails stack.

## Stack

![Ruby](https://img.shields.io/badge/Ruby-3.4-CC342D?logo=ruby)
![Rails](https://img.shields.io/badge/Rails-8.1-CC0000?logo=rubyonrails)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57?logo=sqlite)
![Puma](https://img.shields.io/badge/Puma-Web_Server-5C5543)
![Hotwire](https://img.shields.io/badge/Hotwire-Turbo_+_Stimulus-FF4F00)
![Importmap](https://img.shields.io/badge/Importmap-Rails-CC0000)
![Propshaft](https://img.shields.io/badge/Propshaft-Assets-6E56CF)
![Jbuilder](https://img.shields.io/badge/Jbuilder-JSON_API-CC0000)
![Solid Queue](https://img.shields.io/badge/Solid_Queue-Background_Jobs-1E88E5)
![Solid Cache](https://img.shields.io/badge/Solid_Cache-Rails-43A047)
![Solid Cable](https://img.shields.io/badge/Solid_Cable-Action_Cable-8E24AA)
![Docker](https://img.shields.io/badge/Docker-Kamal_Ready-2496ED?logo=docker)
![Testing](https://img.shields.io/badge/Testing-Minitest-00C853)
![Quality](https://img.shields.io/badge/Code_Quality-RuboCop-000000)
![Security](https://img.shields.io/badge/Security-Brakeman-orange)
![Audit](https://img.shields.io/badge/Bundler_Audit-Enabled-yellowgreen)

## Overview

A Rails blog application featuring articles, comments, validations, associations, and modern Rails development tooling.

## Features

- Article management
- Comment management
- Active Record associations
- Model validations
- RESTful controllers
- HTML views with ERB
- JSON endpoints with Jbuilder
- Hotwire support (Turbo + Stimulus)
- SQLite database
- Background job support with Solid Queue
- Caching with Solid Cache
- Action Cable support with Solid Cable

## Tech Stack

### Backend

- Ruby
- Ruby on Rails
- SQLite3
- Puma
- Active Record
- Jbuilder

### Frontend

- ERB
- Hotwire
- Turbo
- Stimulus
- Importmap

### Testing & Quality

- Minitest
- Capybara
- Selenium WebDriver
- RuboCop Rails Omakase
- Brakeman
- Bundler Audit

### DevOps & Tooling

- Docker
- Kamal
- Thruster
- Bootsnap

## Getting Started

Clone the repository:

```bash
git clone https://github.com/armandomariscal/blog.git
cd blog
```

Install dependencies:

```bash
bundle install
```

Setup the database:

```bash
bin/rails db:create
bin/rails db:migrate
```

Start the application:

```bash
bin/dev
```

http://localhost:3000

## Testing

Run the test suite:

```bash
bin/rails test
```

Run linting:

```bash
bin/rubocop
```

Run security analysis:

```bash
bin/brakeman
```

Run dependency audit:

```bash
bundle exec bundler-audit check --update
```

## License

MIT
