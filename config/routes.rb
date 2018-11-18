Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :users
  resources :deployments, except: [:show]
  resources :sample_units, except: [:show]

  namespace :list_maintenance, as: '' do
    resources :broad_habitats, except: [:show]
    resources :clutter_types, except: [:show]
    resources :contacts, except: [:show]
    resources :distance_ranges, except: [:show]
    resources :geodetic_systems, except: [:show]
    resources :local_habitats, except: [:show]
    resources :organizations, except: [:show]
    resources :speciess, except: [:show]
    resources :species_groups, except: [:show]
  end
end
