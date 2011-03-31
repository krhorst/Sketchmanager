class Group < ActiveRecord::Base

  validates :name,    :presence => true,
                      :length => { :within => 4..80 }

end
