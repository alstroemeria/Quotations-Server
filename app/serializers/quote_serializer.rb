class QuoteSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :text
  has_one :category
  has_one :author
end
