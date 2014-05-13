class Quote < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
  belongs_to :author
  after_initialize :default_values
  
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  private
    def default_values
      self.favorites ||= 0
    end
end
