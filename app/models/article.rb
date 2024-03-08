class Article < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :category, presence: true
end
