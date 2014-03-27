class QuoteSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :text
  has_one :category
end
