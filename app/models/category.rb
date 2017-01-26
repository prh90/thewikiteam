class Category < ApplicationRecord
  validates :title, presence: true

  has_many :articles_categories
  has_many :articles, through: :articles_categories
end
