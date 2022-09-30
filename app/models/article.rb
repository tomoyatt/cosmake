class Article < ApplicationRecord

  has_many :comments,           dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :category_articles,  dependent: :destroy
  has_many :categories, through: :category_articles
  belongs_to :user
  
  # 管理者用アソシエーション
  # belongs_to :admin, optional: true

  has_one_attached :image
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  

  
  # 投稿の公開・非公開
  scope :published, -> {where(is_active: true)}
  scope :unpublished, -> {where(is_active: false)}
  
end
