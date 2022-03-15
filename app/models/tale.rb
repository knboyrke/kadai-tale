class Tale < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }
  
  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end
end
