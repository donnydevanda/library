class Borrower < ApplicationRecord
  has_many :loans, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_validation :assign_card_number, on: :create

  private

  def assign_card_number
    self.id_card_number = "ID-#{SecureRandom.alphanumeric(6).upcase}"
  end
end
