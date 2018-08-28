class CreateSoccerClub < ActiveRecord::Migration[5.1]
  def change
    create_table :soccer_clubs do |t|
      t.string :title
      t.string :city
      t.string :sponsors
      t.boolean :professional, default: true
    end
  end
end
