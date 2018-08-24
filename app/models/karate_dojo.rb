class KarateDojo < ApplicationRecord
  include Searchable

  validates :name, :category, :activity_code, :city, presence: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name
      indexes :city
      indexes :activity_code
      indexes :category
    end
  end
end
