# protected_record

## Setup for rails applications

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

### Your models

Lastly, you'll need to prepare your models.
There's **two types** of models at play here:

1. User (for now I expect a `User` class and `current\_user` method
2. Your records .. these are the models you want to track

So, in your models add `require "protected_record"` and

```ruby
# app/models/user.rb
include ProtectedRecord::ChangeRequest::Changer
include ProtectedRecord::ChangeLog::Changer
```

```ruby
# app/models/any.rb

include ProtectedRecord::ChangeRequest::Changeling
include ProtectedRecord::ChangeLog::Changeling
```

## Usage

1. protected_record will prevent changes to attributes you specify as protected.
2. Any attempted change will be logged as a
   `ProtectedRecord::ChangeRequest::Record`.
3. If any changes are allowed through the filter, protected_record
   will create a `ProtectedRecord::ChangeLog::Record` to log who changed what,
   and for which record.
4. **Important**: ProtectedRecord is opt-in only. It does not change the
   behavior of any AR methods, nor does it place any callbacks in your models.
   In order to update with protection, use the following:

This user can change anything but `:do_not_resuscitate`and `:organ_donor`.
Rejected changes will create `ProtectedRecord::ChangeRequest::Record` objects.
Permitted changes will create `ProtectedRecord::ChangeLog::Record` objects.

```ruby
ready = ProtectedRecord::UseCase::Update.new({
  user:             current_user,
  params:           record_params,
  protected_record: @record,
  protected_keys:   %w{ do_not_resuscitate organ_donor }
})

result = ready.execute!

result.successful? #=> true
```

and

```ruby
# Who changed what, and when
@user.change_log_records

# Who attempted to change what, and when
@user.change_request_records

# What changed, and when
@record.change_log_records

# What changes were attempted, and when
@record.change_request_records
```

## Contributing

Please do. There's plenty that could be done to round out both the interface
and the the feature set.

Issues and pull requests would be most appreciated.
