class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :admin
  belongs_to :article
  
end
