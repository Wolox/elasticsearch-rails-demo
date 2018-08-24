class CreateKarateDojo < ActiveRecord::Migration[5.1]
  def change
    create_table :karate_dojos do |t|
      t.string :name
      t.string :city
      t.string :activity_code
      t.string :category
    end
  end
end
