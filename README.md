# protected_record

Please see [protected_record](https://github.com/rthbound/protected_record) for more detailed usage instructions.

## Quick Setup for rails applications

This engine was created to provide the necessary migrations as well as a (very)
basic interface for triaging `ProtectedRecord::ChangeRequest::Record` objects.
You are free to use this gem without the engine, but you'll need to
[grab these](https://github.com/rthbound/protected_record_manager/tree/master/db/migrate)
and [this](https://github.com/rthbound/protected_record) to get up and running.

### Routes and migrations

Add to your Rails application's Gemfile:

```ruby
gem "protected_record_manager"
```

And to your Rails application's `routes.rb`:

```ruby
mount ProtectedRecordManager::Engine,
  at: "/protected_record_manager", # or whatever
  as: "protected_record_manager"   # or what not
```

Which will provide a user interface for triaging change requests at:

```
http://localhost:3000/protected_record_manager/change_requests
```

**Important:** Only users with `@user.protected_record_manager == true`
will be able to access the aforementioned resources.

Now copy over and run the migrations:

```
$ rake protected_record_manager:install:migrations
$ rake db:migrate
```

## Contributing

Please do. There's plenty that could be done to round out both the interface
and the the feature set.

Issues and pull requests would be most appreciated.
