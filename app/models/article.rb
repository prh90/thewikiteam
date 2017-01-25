class Article < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :sections
  has_many :articles_categories
  has_many :categories, through: :articles_categories
  has_many :revisions, through: :sections
  has_many :revisors, through: :revisions
end
