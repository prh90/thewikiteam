class User < ApplicationRecord

  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  has_many :created_articles, class_name: 'Article', foreign_key: "creator_id"
  # revision is a table of logs when a section is changed
  has_many :revisions
  # a revised section is a section that has been revised
  has_many :revised_sections, through: :revisions, source: :section
end
