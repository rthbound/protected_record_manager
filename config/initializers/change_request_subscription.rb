ActiveSupport::Notifications.subscribe("protected_record_update") do |*args|
  event   = ActiveSupport::Notifications::Event.new(*args)
  request = event.payload[:update_result].data[:updated].change_request_records.last

  event.payload[:listeners].each do |user|
    ProtectedRecordManager::ChangeRequestMailer.notify(user, request).deliver
  end
end

