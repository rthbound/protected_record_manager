ActiveSupport::Notifications.subscribe("protected_record_change_request") do |*args|
  event   = ActiveSupport::Notifications::Event.new(*args)
  request = event.payload[:change_request]

  if request.present?
    users = event.payload[:record_managers]

    ProtectedRecordManager::ChangeRequestMailer.notify(users, request).deliver
  end
end
