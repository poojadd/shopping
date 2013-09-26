# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  price         :float
#  material_type :string(255)
#  size          :string(255)
#  color         :string(255)
#  band_id       :integer
#  category_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#



class Admin::Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  acts_as_taggable
   SIZE = ['XS', 'S', 'M', 'L', 'XL', 'XXL']
  COLOR = ['Black', 'White', 'Red', 'Brown' ]
  GENDER = ['Men', 'Women']
  attr_accessible :category_id, :name, :description, :price, :material_type, :brand_id, :size, :color, :tag_list, :image
  validates :name, :presence => true
  validates :price, :presence => true
  validates_numericality_of :price
  mount_uploader :image, ImageUploader


end
