class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user_id, :presence => true
  validates :group_id, :presence => true
  validates_uniqueness_of :group_id, :scope => [:user_id]

end
