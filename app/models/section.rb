class Section < ApplicationRecord
  validates :title, :body, :article_id, presence: true

  belongs_to :article
  has_many :revisions
  has_many :users, through: :revisions
end
