class SoccerClub < ApplicationRecord
  include Searchable

  # we are assuming this fields as string fields
  validates :title, :city, :sponsors, :professional, presence: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :city, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :sponsors, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
    end
  end
end
