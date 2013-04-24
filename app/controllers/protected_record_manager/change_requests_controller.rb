require_dependency "protected_record_manager/application_controller"

module ProtectedRecordManager
  class ChangeRequestsController < ApplicationController
    before_filter :ensure_record_manager

    # GET /change_requests
    # GET /change_requests.json
    def index
      if current_user.protected_record_manager
        @change_requests = ProtectedRecord::ChangeRequest::Record.where(closed_by_id: nil)
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @change_requests }
      end
    end

    # GET /change_requests/1
    # GET /change_requests/1.json
    def show
      @change_request = ProtectedRecord::ChangeRequest::Record.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @change_request }
      end
    end

    # GET /change_requests/1/edit
    def edit
      @change_request = ProtectedRecord::ChangeRequest::Record.find(params[:id])
    end

    # PUT /change_requests/1
    # PUT /change_requests/1.json
    def update
      @change_request = ProtectedRecord::ChangeRequest::Record.find(params[:id])

      protected_record = @change_request.recordable
      changes = ActiveSupport::JSON.decode(@change_request.requested_changes)

      changes.each do |k,v|
        changes[k] = v.last
      end

      ActiveRecord::Base.transaction do
        # Save the request as closed
        @change_request.closed_by_id = current_user.id
        @change_request.save

        # Make the change
        binding.pry
        ProtectedRecord::UseCase::Update.new({
          params:           changes,
          user:             current_user,
          protected_record: protected_record,
          protected_keys:   []
        }).execute!

        # Log the closing of this request
        ProtectedRecord::UseCase::ChangeLog::Create.new({
          record_class: ProtectedRecord::ChangeLog::Record,
          user:         current_user,
          changed_object: @change_request
        }).execute!
      end

      respond_to do |format|
        if @change_request.closed_by_id.present?
          format.html { redirect_to change_request_path(@change_request), notice: 'Change request was successfully updated.' }
        else
          flash[:alert] = "Changes not applied."
          format.html { render action: "edit" }
        end
      end
    end
  end
end
