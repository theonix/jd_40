class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :year
      t.text :summary
      t.references :life, index: true
      t.timestamps
    end
  end
end
