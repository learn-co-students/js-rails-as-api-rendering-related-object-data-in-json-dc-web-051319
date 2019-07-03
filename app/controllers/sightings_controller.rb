# frozen_string_literal: true

class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: %i[bird location]
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting.to_json(include: %i[bird location])
    else
      render json: { message: 'No sighting found with that id' }
    end
  end
end
