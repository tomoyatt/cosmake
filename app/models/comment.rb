class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :article
  
  # 管理者用アソシエーション
  # belongs_to :admin
end
