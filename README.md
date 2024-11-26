# Forum

<p align="center">
    <a href="https://github.com/rubocop/rubocop">
        <img alt="Code style" src="https://img.shields.io/badge/code_style-rubocop-brightgreen.svg">
    </a>
    <a href="/coverage">
        <img alt="Coverage" src="/coverage/coverage.svg">
    </a>
    <a href="https://github.com/HarrisFauntleroy/forum/graphs/contributors">
        <img alt="GitHub contributors" src="https://img.shields.io/github/contributors-anon/HarrisFauntleroy/forum?&style=flat">
    </a>
    <a href="https://github.com/HarrisFauntleroy/forum/actions">
        <img alt="GitHub branch checks state" src="https://img.shields.io/github/checks-status/HarrisFauntleroy/forum/main?&style=flat">
    </a>
    <a href="https://github.com/HarrisFauntleroy/forum/issues">
        <img alt="GitHub issues" src="https://img.shields.io/github/issues/HarrisFauntleroy/forum?&style=flat">
    </a>
    <a href="https://github.com/HarrisFauntleroy/forum/issues">
        <img alt="GitHub issues" src="https://img.shields.io/github/last-commit/HarrisFauntleroy/forum?&style=flat">
    </a>
    </a>
    <a href="https://github.com/HarrisFauntleroy/forum/issues">
        <img alt="GitHub issues" src="https://img.shields.io/github/commit-activity/w/HarrisFauntleroy/forum?&style=flat">
    </a>
</p>

## Overview

A full-featured forum application built with Ruby on Rails.

## Prerequisites

Before setting up the project, ensure you have the following installed:

- Ruby (via [rvm](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv))
- Bundler (`gem install bundler`)
- PostgreSQL (via Homebrew or [Postgres.app](https://postgresapp.com/))
- Redis (for caching and background jobs)

## Setup

### Ruby Installation

```bash
brew install rvm
rvm install $(cat .ruby-version)
rvm use
```

### Dependencies

Install project dependencies:

```bash
bundle install
```

### Database Setup

Create and initialize the PostgreSQL database:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

For a fresh start:
```bash
rails db:drop db:create db:schema:load db:migrate db:seed
```

## Development

Start the Rails server in development mode:

```bash
rails server
# or
rails s
```

Access the Rails console:
```bash
rails console
# or
rails c
```

The application will be available at `http://localhost:3000`.

_For additional commands and options, please refer to the Makefile._

### Testing

Run the full test suite:

```bash
rails rspec
```

Run specific tests:

```bash
# Run all tests in a specific file
rspec spec/controllers/user_controller_spec.rb
# Run a specific test
rspec spec/controllers/user_controller_spec.rb:32
```

### Utility Commands

_For additional commands and options, please refer to the Makefile._

## Contributing

We welcome contributions! Please see our [contribution guidelines](CONTRIBUTING.md) for details on how to get involved.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE.md) for details.

## Disclaimer

This software is currently in alpha development and should be used with caution. Features and APIs may change as development continues. Your feedback is valuable and appreciated!
