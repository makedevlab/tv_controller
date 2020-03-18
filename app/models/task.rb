class Task < ApplicationRecord
  has_one_attached :thumbnail
  has_many :chores, dependent: :restrict_with_error

  validates :name, presence: true
end
