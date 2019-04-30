class GasstationsController < ApplicationController
  before_action :set_gasstation, only: [:show, :update, :destroy]
    # GET /todos
    def index
      @gasstations = Gasstation.all
      json_response(@gasstations)
    end

    # POST /todos
    def create
      @gasstation = Gasstation.create!(todo_params)
      json_response(@gasstation, :created)
    end

    # GET /todos/:id
    def show

      # @todos = Todo.all
      # dis = 9999
      # gs_id = 0
      # array_gs = []
      # price_tester = 99999
      #
      #
      # @todos.each do |station|
      #   dis_tester = ((station.lat - user_lat)**2 + (station.lon - user_lon)**2)**(1/2)
      #   if dis_tester < radius
      #      array_gs << station
      #   end
      # end
      #
      # array_gs.each do |station|
      #   if station.price < price_tester
      #      price_tester = station.price
      #   end
      # end
      t = Gasstation.new
      t.nearby(params["user_lat"].to_f, params["user_lon"].to_f, params["radius"].to_f)
      t.cheapest

      json_response(t.cheapest)
    end

    # PUT /todos/:id
    def update
      @gasstation.update(todo_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @gasstation.destroy
      head :no_content
    end

    private

    def todo_params
      # whitelist params
      params.permit(:brand, :created_by, :price, :lat, :lon,:user_lat, :user_lon, :radius)
    end

    def set_gasstation
      @gasstation = Gasstation.find(params[:id])
    end

  end
