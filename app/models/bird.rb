# frozen_string_literal: true

class Bird < ApplicationRecord
  has_many :sightings
  has_many :locations, through: :sightings
end
