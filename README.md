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

### Events & Notifications

I've added an [initializer](https://github.com/rthbound/protected_record_manager/blob/master/config/initializers/change_request_subscription.rb) which subscribes to instrumentations of the "protected_record_change_request" event.

To fire the email, you will need to instrument the event yourself (example provided). If you fail to provide a change request object when you instrument the event, nothing will happen. The email will be sent to all users where `user.protected_record_manager #=> true`.

```ruby
ActiveSupport::Notifications.instrument("protected_record_change_request", {
  change_request: update_result.data[:change_request],
  record_managers: User.where(protected_record_manager: true)
})
```

To set the default from address, create in your rails app an initializer that does the following: `ProtectedRecordManager::Configuration.default_from = "foo@bar.com"`

Unless you configure a default from address, this engine will use "no-reply@example.com"

## Contributing

Please do. There's plenty that could be done to round out both the interface
and the the feature set.

Issues and pull requests would be most appreciated.
