class User < ActiveRecord::Base
  has_many :quotes
  has_many :favorites
  has_many :favorite_quotes, through: :favorites, source: :quotes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
