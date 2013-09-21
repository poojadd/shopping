# == Schema Information
#
# Table name: role_users
#
#  id         :integer          not null, primary key
#  roles_id   :integer
#  users_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoleUser < ActiveRecord::Base
  attr_accessible :roles_id, :users_id
  belongs_to :user
  belongs_to :role
end
