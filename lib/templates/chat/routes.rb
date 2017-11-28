  resources :chats, only: %w[:index :show :create] do
    memeber do
      post :visit
    end
  end
