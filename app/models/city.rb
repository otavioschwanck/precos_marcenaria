class City < ActiveRecord::Base
  belongs_to :state
  has_many :branches
  def self.get_cities
  	all.collect{|city| ["#{city.name} - #{city.state.acronym}", city.id]}
  end

  def self.search(query)
    all.where(["name ILIKE :q", q: "%#{query}%"])
  end
end
