        resources :chats, only: %i[index show create] do
          resources :messages, only: :create
          member do
            post :visit
          end
        end