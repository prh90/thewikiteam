class Article < ApplicationRecord
  validates :title, :summary, presence: true

  belongs_to :creator, class_name: "User"
  has_many :sections
  has_many :images
  has_many :articles_categories
  has_many :categories, through: :articles_categories
  has_many :revisions, through: :sections
  has_many :revisors, through: :revisions, source: :user
end
