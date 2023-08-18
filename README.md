# Rails-Pokemon-API

This is a basic RESTful Pokemon API that lets you execute CRUD actions.

## Installation
It's built with **Rails 7** and **Ruby v3.2.2**, using a **Postgresql** database, which means that you will need to have all three installed locally to be able to test it.

Clone the repo, then run
```sh
bundle install
```

to install all necessary gems for the project.

Prepare your local database with
```sh
rails db:create db:migrate db:seed
```
This will seed a list of existing pokemons in the db.

Start the server with
```sh
rails server
```
## Usage

Test with Postman or Insomnia using the following URL:
```sh
localhost:3000/api/v1/
```

If you wish, you can import the Postman Collection available at the root of the project as a basis.

Pagination has been implemented with the [Pagy](https://github.com/ddnexus/pagy) gem. To get a paginated list, you may use the `page` param:
```sh
localhost:3000/api/v1/pokemons?page=1
```

By default, it will return 25 items per page. You can override this by using the `items` param:
```sh
localhost:3000/api/v1/pokemons?page=2&items=10
```

## Tests
Run all tests with **Rspec**:
```sh
bundle exec rspec
```

## Future development
This is meant to be used locally for fun! There is no user authentication/authorization implemented.
However, this could be a next step: implement Devise and [Devise-JWT](https://github.com/waiting-for-dev/devise-jwt).

To make the local installation easier, we could also use Docker (docker-compose), especially for the db.

We could also send better JSON responses by using [jbuilder](https://github.com/rails/jbuilder) for serialization, especially if the pokemon data gets more complex.
