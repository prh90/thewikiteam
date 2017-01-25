class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :created_articles, class_name: 'Article', foreign_key: "creator_id"
  has_many :revisions
  has_many :revised_sections, through: :revisions
end
