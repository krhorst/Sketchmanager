class Scene < ActiveRecord::Base
  belongs_to :group
  
  validates :name, :presence => true, :length => { :within => 3..60 }
  validates :description, :presence => true
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
