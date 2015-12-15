Ecm::News::Backend::Engine.routes.draw do
  resources :items do
    member do
      post :toggle_published
    end
  end

  root to: 'home#index'
end
