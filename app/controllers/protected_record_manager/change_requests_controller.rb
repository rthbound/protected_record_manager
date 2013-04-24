require_dependency "protected_record_manager/application_controller"

module ProtectedRecordManager
  class ChangeRequestsController < ApplicationController
    before_filter :ensure_record_manager

    # GET /change_requests
    # GET /change_requests.json
    def index
      if current_user.record_manager
        @change_requests = ProtectedRecord::ChangeRequest::Record.all
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @change_requests }
      end
    end

    # GET /change_requests/1
    # GET /change_requests/1.json
    def show
      @change_request = ChangeRequest.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @change_request }
      end
    end

    # GET /change_requests/1/edit
    def edit
      @change_request = ChangeRequest.find(params[:id])
    end

    # PUT /change_requests/1
    # PUT /change_requests/1.json
    def update
      @change_request = ChangeRequest.find(params[:id])

      respond_to do |format|
        if @change_request.update_attributes(params[:change_request])
          format.html { redirect_to @change_request, notice: 'Change request was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @change_request.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
