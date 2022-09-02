class Article < ApplicationRecord
  
  has_many :comments,           dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :category_articles,  dependent: :destroy
  belongs_to :user
  belongs_to :admin
  
end
