# README

## Requirements

- ruby 3.0.3
- postgresql database(any recent version should do)

## Setup

1. Add config/database.yaml (you can copy config/database.yaml.example and customize it)
2. Run `bundle` to install required gems
3. Run `bundle exec rails db:setup` to setup the database

## Tests

`bundle exec rspec` to run whole test suite
`bundle exec rspec path/to/filename_spec.rb:line_number` to run specific line of specific file

## Notes
[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) are used in specs

## TODO
- Iban validation is just a basic checksum validation more in `app/models/iban.rb`
- Api documentation
- Deployment(heroku/docker)
- docker compose for local dev

If this 'should us what rails application should look like':
I like to use [dry-rb](https://dry-rb.org/) libraries(for example):
- [dry-validation](https://dry-rb.org/gems/dry-validation/1.6/) - form objects and replacement for strong params [Nice blog post about it](https://mensfeld.pl/2017/03/dry-validation-as-a-schema-validation-layer-for-ruby-on-rails-api/)
- [dry-container](https://dry-rb.org/gems/dry-container/0.7/) - DI container
- [dry-monads](https://dry-rb.org/gems/dry-monads/1.3/) - Especially[do notation](https://dry-rb.org/gems/dry-monads/1.3/do-notation/)

Why haven't I used them?
To have something to discuss about and because of time constraints - even if setting up each of thoses libs is just 10 minutes - That makes 30 mins for 3 of them, and I don't expect to extend this project much more
