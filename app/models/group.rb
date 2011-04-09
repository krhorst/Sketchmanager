class Group < ActiveRecord::Base

  validates :name,    :presence => true,
                      :length => { :within => 4..80 }


  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
