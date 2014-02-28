class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.text :model
      t.text :uiid
      t.text :os
      t.boolean :connected

      t.timestamps
    end
  end
end
