class HomeworldsController < ApplicationController
    def index
        homeworlds = Homeworlds.all
        render json: homeworlds
    end
end
