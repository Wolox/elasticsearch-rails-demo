class CreateDramaClub < ActiveRecord::Migration[5.1]
  def change
    create_table :drama_clubs do |t|
      t.string :title
      t.string :city
      t.string :category
      t.string :time_range
    end
  end
end
