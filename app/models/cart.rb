# == Schema Information
#
# Table name: carts
#
#  id          :integer          not null, primary key
#  users_id    :integer
#  products_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cart < ActiveRecord::Base
  attr_accessible :users_id, :products_id, :email
  belongs_to :user
  belongs_to :admin_product, :class_name => 'Admin::Product'
end
