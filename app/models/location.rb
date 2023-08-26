class Location < ApplicationRecord
  include PgSearch::Model
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search, against: [:name, :description]
  belongs_to :user
  belongs_to :neighborhood
  has_many :events
  has_many :ratings
  has_one_attached :photo


  def self.categories
    ["Café", "Parque", "Bar", "Loja", "Restaurante", "Museu"]
  end
end
