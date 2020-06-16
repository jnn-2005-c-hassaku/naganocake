Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'home#top'
end
