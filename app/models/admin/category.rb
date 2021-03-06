# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin::Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  has_many :products
end
