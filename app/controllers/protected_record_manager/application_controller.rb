module ProtectedRecordManager
  class ApplicationController < ActionController::Base
    def ensure_record_manager
      current_user.protected_record_manager || not_found
    end

    def not_found
      render status: 403, text: 'Resource does not exist, or user lacks required permissions.' and return
    end
  end
end
