Rails.application.routes.draw do
  get 'admin/home'

  get 'admin/index'
  get 'users/login'
  post 'users/login'
  get 'users/new'
  get 'users/new_user'
  get 'users/edit_user'
  get 'users/delete_user'
  post 'users/authenticate'
  post 'users/create'
  post 'users/delete_me'
  get 'users/my_profile'
  get 'users/field_edit'
  post 'users/update_field'
  get 'users/logout'
  post 'users/update_user'
  get 'admin/national_dashboard'
  get 'admin/regional_dashboard'
  get 'admin/district_dashboard'
  get 'admin/northern_zone'
  get 'admin/central_zone'
  get 'admin/southern_zone'
  get 'admin/zone_central_east'
  post 'admin/zone_central_east'
  get 'admin/zone_central_west'
  post 'admin/zone_central_west'
  get 'admin/zone_south_east'
  post 'admin/zone_south_east'
  get 'admin/zone_south_west'
  post 'admin/zone_south_west' 
  get 'admin/diagnosis_settings_menu'
  get 'admin/add_diagnosis'
  get 'admin/view_diagnoses'
  get 'admin/remove_diagnosis'
  get 'admin/feed'
  post 'admin/feed'
  get 'admin/pull_opd_diagnoses'
  post 'admin/pull_opd_diagnoses'
  get 'admin/observations_by_diagnosis'
  post 'admin/observations_by_diagnosis'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'admin#national_dashboard'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
