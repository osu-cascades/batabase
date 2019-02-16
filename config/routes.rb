Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  scope '/admin' do
    resources :users
  end

  resources :deployments

  resources :sample_units

  namespace :list_maintenance, as: '' do
    resources :broad_habitats, except: [:show]
    resources :clutter_types, except: [:show]
    resources :contacts, except: [:show]
    resources :detection_targets, except: [:show]
    resources :detectors, except: [:show]
    resources :distance_ranges, except: [:show]
    resources :geodetic_systems, except: [:show]
    resources :local_habitats, except: [:show]
    resources :organizations, except: [:show]
    resources :sample_designs, except: [:show]
    resources :species, except: [:show]
    resources :species_groups, except: [:show]
    resources :study_areas, except: [:show]
    resources :target_descriptors, except: [:show]
  end

  namespace :api do
    get '/:state_id/counties', to: 'counties#index', defaults: { format: :json }
  end
end
