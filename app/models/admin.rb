class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # 管理者用アソシエーション
  # has_many :articles,   dependent: :destroy
  # has_many :comments,   dependent: :destroy
  # has_many :favorites,  dependent: :destroy
  
end
