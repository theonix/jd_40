class Life < ActiveRecord::Base

  has_many :years, dependent: :destroy
  
end
