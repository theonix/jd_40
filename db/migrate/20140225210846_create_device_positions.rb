class CreateDevicePositions < ActiveRecord::Migration
  def change
    create_table :device_positions do |t|
      t.references :device, index: true
      t.float :lat
      t.float :lng
      t.integer :route_id
      t.timestamps
    end
  end
end
