class Quote < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
  belongs_to :author
end
