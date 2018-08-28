require "elasticsearch/model"

module Searchable
  extend ActiveSupport::Concern
  ngram_filter = { type: 'nGram', min_gram: 2, max_gram: 20 }
  ngram_analyzer = {
    type: 'custom',
    tokenizer: 'standard',
    filter: %w[lowercase asciifolding ngram_filter]
  }
  whitespace_analyzer = {
    type: 'custom',
    tokenizer: 'whitespace',
    filter: %w[lowercase asciifolding]
  }

  included do
    include Elasticsearch::Model

    settings analysis: {
      filter: {
        ngram_filter: ngram_filter
      },
      analyzer: {
        ngram_analyzer: ngram_analyzer,
        whitespace_analyzer: whitespace_analyzer
      }
    }

    after_commit :index_document, if: :persisted?
    after_commit on: [:destroy] do
      __elasticsearch__.delete_document
    end
  end
  private
  def index_document
    __elasticsearch__.index_document
  end
end
