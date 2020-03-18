class Child < ApplicationRecord
  has_one_attached :photo
  has_many :chores, dependent: :destroy
end
