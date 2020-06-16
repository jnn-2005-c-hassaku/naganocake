Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
  root 'home#top'
end
