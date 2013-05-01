module ProtectedRecordManager
  module ChangeRequestsHelper
    def change_count(change_request)
      requested_changes = JSON.parse change_request.requested_changes

      return requested_changes.keys.count
    end

    def requested_changes(change_request)
      JSON.parse change_request.requested_changes
    end
  end
end
