class Category < ApplicationRecord
  
  has_many :category_articles,  dependent: :destroy
  
end
