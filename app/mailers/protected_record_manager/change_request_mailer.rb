module ProtectedRecordManager
  class ChangeRequestMailer < ActionMailer::Base
    default from: ProtectedRecordManager::Configuration.default_from

    def notify(users, change_request)
      @url  = change_request_url(change_request)
      mail({
        to:      users.collect(&:email).join(","),
        subject: "New Change Request from #{change_request.user.email}"
      })
    end
  end
end
