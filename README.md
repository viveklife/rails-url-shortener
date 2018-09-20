# Rails Url Shortener

The Url Shortener is built with Rails framework.

### Setup

Ruby Version:

```
$ ruby -v
$ 2.5.1
```
Rails Version

```
$ rails -v
$ 5.2.1
```

Install gems:

```
$ bundle install
```

Default environment variables are stored in the `env.example` file. You should create both `.env.development` and `.env.test` files with your local configuration details.

```
$ cp .env.example .env.development
$ cp .env.example .env.test
```

Add the provided environment variables to .env.development file.

Create and seed the database:

```
$ rake db:create
$ rake db:migrate
```

Start local server

```
$ rails s

```
Go to your app at: [http://localhost:3000](http://localhost:3000)

## Testing

```
$ rake db:create RAILS_ENV=test
$ bundle exec rspec
```

## API Documentation

 - [creating a shortened url](/api-docs/create-url.md)
 - [fetching list of shortened urls](/api-docs/urls.md)
 - [fetching original url from a shortened url](/api-docs/show-url.md)
 - [deleting shortened-urls](/api-docs/delete-url.md)


## UI & Designing

- Bootstrap 4

