class SightingsController < ApplicationController
    def show
        sighting = Sighting.find(params[:id])
        # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
        render json: sighting, except:[:created_at, :updated_at], include: 
        [
            :bird => {except: [:updated_at, :created_at]},
        :location => {except: [:updated_at, :created_at]}
        ]

    end
end
