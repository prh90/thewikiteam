class Section < ApplicationRecord
  belongs_to :article
  has_many :revisions
  has_many :users, through: :revisions
end
