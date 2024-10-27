Rails.application.routes.draw do
  devise_for :admins
  devise_for :organizers
  devise_for :applicants
  devise_scope :applicant do
    post "applicants/guest_sign_in", to: "applicants/sessions#guest_sign_in"
  end

  get "search", to: "searches#search"

  # organizer routing ...
  namespace :organizers do
    resources :applicants, only: %w(index show)
    resources :organizers, except: %w(create new destroy)
    resources :events do
      resources :event_entries, only: %w(destroy)
    end
  end

  # applicant routing ...
  namespace :applicants do
    resources :applicants, except: %w(create new destroy)
    resources :follows, only: %w(create destroy)
    resources :organizers, only: %w(index show)
    resources :events, only: %w(index show) do
      resources :event_comments, only: %w(create destroy)
      resource :event_entries, only: %w(create destroy)
      resource :bookmarks, only: %w(create destroy)
    end
    get 'bookmarks', to: 'bookmarks#index'
  end

  # admin routing ...
  namespace :admins do
    resources :applicants, only: %w(index update)
    resources :organizers, only: %w(index update)
    resources :events,only: %w(index show destroy) do
      resources :event_comments,only: %w(destroy)
      resources :event_entries, only: %w(destroy)
    end
  end

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
