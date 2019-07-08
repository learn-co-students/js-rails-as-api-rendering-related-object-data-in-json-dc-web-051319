class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      # render json: { id: sighting.id,  bird: sighting.bird,  location: sighting.location }
        # {
        #   "id": 1,
        #   "bird": {
        #     "id": 1,
        #     "name": "Black-Capped Chickadee",
        #     "species": "Poecile Atricapillus",
        #     "created_at": "2019-07-08T19:31:17.710Z",
        #     "updated_at": "2019-07-08T19:31:17.710Z"
        #   },
        #   "location": {
        #     "id": 2,
        #     "latitude": 30.26715,
        #     "longitude": -97.74306,
        #     "created_at": "2019-07-08T19:31:17.733Z",
        #     "updated_at": "2019-07-08T19:31:17.733Z"
        #   }
      # }
      #render json: sighting, include: [:bird, :location], except: [:updated_at]
      # {
        #   "id": 1,
        #   "bird_id": 1,
        #   "location_id": 2,
        #   "created_at": "2019-07-08T19:31:17.761Z",
        #   "updated_at": "2019-07-08T19:31:17.761Z",
        #   "bird": {
        #     "id": 1,
        #     "name": "Black-Capped Chickadee",
        #     "species": "Poecile Atricapillus",
        #     "created_at": "2019-07-08T19:31:17.710Z",
        #     "updated_at": "2019-07-08T19:31:17.710Z"
        #   },
        #   "location": {
        #     "id": 2,
        #     "latitude": 30.26715,
        #     "longitude": -97.74306,
        #     "created_at": "2019-07-08T19:31:17.733Z",
        #     "updated_at": "2019-07-08T19:31:17.733Z"
        #   }
      # }
      render json: sighting.to_json(:include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])
    else
      render json: { message: 'No sighting found with that id'}
    end
  end

end
