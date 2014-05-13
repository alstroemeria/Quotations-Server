class QuoteSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :text, :favorites
  has_one :category
  has_one :author, include: true
end
