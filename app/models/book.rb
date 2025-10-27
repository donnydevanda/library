class Book < ApplicationRecord
  has_many :loans, dependent: :destroy
  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true
end
