Rails.application.routes.draw do

  mount ProtectedRecordManager::Engine => "/protected_record_manager"
end
