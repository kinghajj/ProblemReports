ProblemReport::Application.routes.draw do

  root :to => 'visitor#index'

  resources :statuses

  resources :priorities

  resources :follow_junctions

  resources :work_on_junctions

  resources :problem_report_emails

  resources :problem_report_histories

  resources :problem_report_notes

  resources :escalations

  resources :systems

  resources :categories

  resources :problem_types

  resources :positions

  resources :users

  resources :problem_report_records

  match 'users/login/:id', to: 'users#login', via: :post
  match 'users/logout/', to: 'users#logout', via: :post

  match 'home', to: 'home#index', via: :get
  match 'updateWorkingOnTable/', to: 'home#updateWorkingOnTable', via: :get
  match 'updateAllReportsTable/', to: 'home#updateAllReportsTable', via: :get
  match 'updateFollowReportsTable/', to: 'home#updateFollowReportsTable', via: :get
  match 'updateUnClaimedReportsTable/', to: 'home#updateUnClaimedReportsTable', via: :get
  match 'workOnReport/', to: 'home#workOnReport', via: :post
  match 'quitWorkingOnReport/', to: 'home#quitWorkingOnReport', via: :delete
  match 'followReport/', to: 'home#followReport', via: :post
  match 'unfollowReport/', to: 'home#unfollowReport', via: :delete
  match 'requestAssigningForm', to:'home#requestAssigningForm', via: :get
  match 'assignProblemReports', to:'home#assignProblemReports', via: :put
  match 'clearNotification', to:'home#clearNotification', via: :put

  match 'requestNoteToModify', to: 'problem_report_records#requestNoteToModify', via: :post
  match 'modifyNote', to: 'problem_report_records#modifyNote', via: :put
  match 'initializeStatus', to: 'problem_report_records#initializeStatus',via: :post
  match 'sendEmail', to: 'problem_report_records#sendEmail', via: :post

  match 'addNewNote', to:'problem_report_records#addNewNote', via: :post
  
  match 'visitor/', to: 'visitor#index', via: :get



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
