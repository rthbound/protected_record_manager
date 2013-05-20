module ProtectedRecordManager
  class ChangeRequestMailer < ActionMailer::Base
    default from: ProtectedRecordManager::Configuration.default_from

    def notify(user, change_request)
      @user = user
      @url  = change_request_url(change_request)
      mail({
        to:      user.email,
        subject: "New Change Request from #{change_request.user.email}"
      })
    end
  end
end
