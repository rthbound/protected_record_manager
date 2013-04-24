ProtectedRecordManager::Engine.routes.draw do
  resources :change_requests, controller: "protected_record_manager/change_records",
    except: [:destroy, :new, :create]
end
