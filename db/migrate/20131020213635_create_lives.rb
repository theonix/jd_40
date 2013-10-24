class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.date :dob
      t.string :of
      t.timestamps
    end
  end
end
