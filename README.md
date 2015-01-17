# Dalli UI

[![Gem Version](https://badge.fury.io/rb/dalli-ui.svg)](http://badge.fury.io/rb/dalli-ui)

[ ![Codeship Status for phawk/dalli-ui](https://codeship.io/projects/97682f30-2dfb-0132-c2b8-5e5bd29e6176/status)](https://codeship.io/projects/39299)

Dalli UI is a mountable engine for Rails apps that displays information about your [dalli](https://github.com/mperham/dalli) memcached instance and allows you to flush it from a web interface.

![Dalli UI Sample](./docs/sample.png)

## Rails 4 installation

Add **dalli** and **dalli-ui** to your gemfile and `bundle install`.

```rb
# Gemfile
gem 'dalli'
gem 'dalli-ui'
```

Setup [dalli](https://github.com/mperham/dalli) as your Rails cache store.

```rb
# config/application.rb
config.cache_store = :dalli_store
```

Mount Dalli UI on a route of your choosing

```rb
# config/routes.rb
mount Dalli::Ui::Engine, at: "dalli"
```

In a production environment you probably don't want to allow just anyone to access this page.

Authentication example with [Devise](https://github.com/plataformatec/devise) that ensures that the user is an admin:

```rb
# config/routes.rb
authenticate :user, lambda { |u| u.admin? } do
  mount Dalli::Ui::Engine, at: "dalli"
end
```
