class Group < ActiveRecord::Base

  after_create :create_owner_membership

  validates :name,    :presence => true,
                      :length => { :within => 4..80 }
  has_many :scenes
  belongs_to :user
  has_many :memberships

  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  private

  def create_owner_membership
    self.memberships.create({ :user_id => self.user_id, :level => '4' })
  end
  
end
