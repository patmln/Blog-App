Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'articles', to: 'articles#index', as: 'articles'
  # post 'articles', to: 'articles#create'
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  # get 'articles/:id', to: 'articles#show', as: 'article'
  # patch 'articles/:id', to: 'articles#update'
  # delete 'articles/:id', to: 'articles#destroy'

  resources :articles do
    collection do
      get 'create_new'
      #get 'create_new', to: 'articles#create_new', as: 'create_new_articles'
      #create_new_articles GET    /articles/create_new(.:format)                                                                    articles#create_new
    end
    resources :comments do
      collection do
        get 'create_new'
      end
    end
  end

  root to: 'articles#index'
  
  # get 'authors', to: 'authors#index', as: 'authors'
  # post 'authors', to: 'authors#create'
  # get 'authors/new', to: 'authors#new', as: 'new_author'
  # get 'authors/:id/edit', to: 'authors#edit', as: 'edit_author'
  # get 'authors/:id', to: 'authors#show', as: 'author'
  # patch 'authors/:id', to: 'authors#verify'
  # #patch 'authors/:id', to: 'authors#verify_date'
  # patch 'authors/:id', to: 'authors#update'
  # delete 'authors/:id', to: 'authors#destroy'

  # #resources :authors

  # root to: 'authors#index'
end
