Rails.application.routes.draw do

	devise_for :admins, controllers: {
		sessions: 'admins/sessions'
	}
	devise_for :customers, controllers: {
		registrations: 'customers/registrations',
		sessions: 'customers/sessions'
	}
	root 'home#top'

	resources :products
	resources :customers
	resources :orders do
			collection do
			get 'confirm'
			get 'thanks'
			resource :order_items, only: [:create]
		end
	end

	resources :shipping_addresses
	resources :cart_items do
			collection do
			delete 'destroy_all'
		end
	end
	namespace :admins do
		get 'home' => 'home#top'
		resources :customers
		resources :products
		resources :orders
		resources :categories
	end
end
