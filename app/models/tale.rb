class Tale < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 1000 }
end
