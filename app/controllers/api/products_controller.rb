class Api::ProductsController < ApplicationController
    # before_action :doorkeeper_authorize! # Requires access token for all actions
    
    before_action -> { doorkeeper_authorize! :read, :write }

    def index
        users = current_resource_owner
        render json: users
    end

    def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

  end