class Product < ActiveRecord::Base
  belongs_to :branch
  require 'carrierwave/orm/activerecord'
  mount_uploader :imagem, ImagemUploader
end
