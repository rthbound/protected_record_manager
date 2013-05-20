## 0.1.2
### 20 May, 2013

Takes advantage of [protected_record 0.1.2](https://github.com/rthbound/protected_record/blob/master/CHANGELOG.md#012) by adding a mailer and an event subscription (using [AS::Notifications](http://api.rubyonrails.org/classes/ActiveSupport/Notifications.html)). Allows rails apps to instrument the `protected_record_change_request` event in order to fire off notifications.

