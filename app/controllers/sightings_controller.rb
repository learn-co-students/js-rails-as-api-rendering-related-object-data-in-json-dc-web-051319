class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(:include =>{
                :bird => {:only =>[:name, :species]},
                :location => {:only => [:longitude, :latitude]}
            }, :except => [:updated_at])
        else
            render json: {message: "no sighting found with this id"}
        end
    end
end

# render json: sighting.to_json(:include => {
#     :bird => {:only => [:name, :species]},
#     :location => {:only => [:latitude, :longitude]}
#   }, :except => [