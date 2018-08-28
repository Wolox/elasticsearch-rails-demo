class CreatePhotographyWorkshop < ActiveRecord::Migration[5.1]
  def change
    create_table :photography_workshops do |t|
      t.string :name
      t.string :city
      t.integer :max_students
      t.integer :available_cameras
    end
  end
end
