ProtectedRecordManager::Engine.routes.draw do
  resources :change_requests, controller: "change_requests",
    except: [:destroy, :new, :create]
end
