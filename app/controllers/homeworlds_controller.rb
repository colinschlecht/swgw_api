class HomeworldsController < ApplicationController
    def index
        homeworlds = Homeworld.all
        render json: homeworlds
    end
end
