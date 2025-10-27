class Book < ApplicationRecord
  has_many :loans
  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true
end
