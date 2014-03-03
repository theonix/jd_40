class CreateDeletings < ActiveRecord::Migration
  def change
    create_table :deletings do |t|
      t.string :delete

      t.timestamps
    end
  end
end
