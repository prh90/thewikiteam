class Revision < ApplicationRecord
  validates :user_id, :section_id, presence: true

  belongs_to :user
  belongs_to :section
end
