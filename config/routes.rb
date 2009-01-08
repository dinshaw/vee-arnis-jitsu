ActionController::Routing::Routes.draw do |map|

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users, :member => { :suspend   => :put,
    :unsuspend => :put,
    :purge     => :delete
  }
  map.resource :session
  map.forgot_password '/forgot_password', :controller => 'users', :action => 'forgot_password'
  map.reset_password '/reset_password/:password_reset_code', :controller => 'users', :action => 'reset_password'
  map.change_password '/change_password', :controller => 'users', :action => 'change_password'

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  map.resources :ical_events

  map.schedule '/schedule/:month', :controller => 'home', :action => 'schedule'
  map.resources :news_items,:events,:professors, :awards, :memorials, :video_categories,:systems, :facilities, :programs, :links, :pages, :testimonials

  map.resources  :article_categories, :has_many => :articles
  map.resources  :photo_categories, :has_many => :photos
  map.resources  :video_categories, :has_many => :videos
  map.resources :store_categories, :has_many => :products  
  
  map.download_video "/download_video/:id.:format", :controller => "videos", :action => "download_video"
  
  map.admin "admin", :controller => "admin", :action => "index"

  map.namespace(:admin) do |admin| 
    admin.resources :users, :member => { :suspend   => :put, :unsuspend => :put, :purge => :delete, :approve => :put, :deny => :put }
    admin.search_users "search_users", :controller => "users", :action => "index"

    admin.resources :roles, :users, :preferences, :emails, :taggings, :tags
    admin.resources :cms_pages, :member => { :up => :put, :down => :put }
    admin.resources :select_options, :member => { :up => :put, :down => :put } 
    admin.resources :config_values, :member => { :up => :put, :down => :put }      

    admin.resources :faq_categories, :member => { :up => :put, :down => :put } do |cat|
      cat.resources :faqs, :member => { :up => :put, :down => :put }
    end
    admin.superuser_member_override "superuser_member_override", :controller => "members", :action => "superuser_member_override"

    admin.resources :roles,  :config_values, :events, :articles, :article_categories, :videos, :video_categories, :pages, :testimonials
    admin.resources :systems, :member => { :up => :put, :down => :put }
    admin.resources :news_items, :member => { :up => :put, :down => :put }
    admin.resources :links, :member => { :up => :put, :down => :put }
    admin.resources :professors, :member => { :up => :put, :down => :put }
    admin.resources :memorials, :member => { :up => :put, :down => :put }
    admin.resources :awards, :member => { :up => :put, :down => :put }    
    admin.resources :programs, :member => { :up => :put, :down => :put }
    admin.resources :facilities, :member => { :up => :put, :down => :put }

    admin.resources :photo_categories, :member => { :up => :put, :down => :put } do |photo_category|
      photo_category.resources :photos, :member => { :up => :put, :down => :put }
    end
    admin.resources :video_categories, :member => { :up => :put, :down => :put } do |video_category|
      video_category.resources :videos, :member => { :up => :put, :down => :put }
    end
    admin.resources :article_categories, :member => { :up => :put, :down => :put } do |article_category|
      article_category.resources :articles, :member => { :up => :put, :down => :put }
    end
    admin.resources :store_categories, :member => { :up => :put, :down => :put } do |store_category|
      store_category.resources :products, :member => { :up => :put, :down => :put }
    end
  end

  map.resources :cms_pages
  map.cms_page "/:reference_string", :controller => "cms_pages", :action => "show"

  # Install the default routes as the lowest priority.
  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
end
