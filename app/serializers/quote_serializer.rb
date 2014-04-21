class QuoteSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :text
  has_one :category
end
