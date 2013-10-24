class CreateNewJdLife < ActiveRecord::Migration
  def change

    life = Life.create of: "Jesús Domenech", dob: '1973-12-01'
    (0..40).each {|y| life.years.create(year:y) }
    
  end
end
