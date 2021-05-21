# Vehicle Example API

A sample Rails API for test purposes.

Created using the command above:

```bash
rails new vehicles-example-api --database=postgresql --skip-action=mailbox --skip-action-text --skip-spring -T --skip-turbolinks --api
```

## Goals ✓

- [x] Simple API
- [ ] Authentication
- [ ] Unit tests
- [ ] System tests
- [ ] Stress tests
- [ ] Docs

## Helpful commands

```bash
# Run any rails command into docker container
docker-compose run --rm app bundle exec rails console

# Test the whole app into docker
docker-compose run -e RAILS_ENV=test --rm app bundle exec rspec

# Test the whole app locally
DATABASE_HOST=localhost bundle exec rspec

# Generate Swagger docs
docker-compose run --rm app bundle exec rails rswag:specs:swaggerize

```
