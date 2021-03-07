class SpeciesController < ApplicationController

    species = Species.all
    render json: species
end
