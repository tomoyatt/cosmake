class Category < ApplicationRecord
  
  has_many :category_articles,  dependent: :destroy
  
  validates :name, presence: true
  
end
