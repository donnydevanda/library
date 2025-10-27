class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :borrower
  validate :validate_rules, on: :create
  before_validation :check_deadline, on: :create

  private

  def check_deadline
    self.borrowed_at = Time.now
    self.return_deadline = (borrowed_at + 30.days).end_of_day if self.return_deadline.blank?
  end

  def validate_rules
    errors.add(:base, "Book not available") if Loan.where(book_id: book_id, status: 1).count == Book.find(book_id).stock
    errors.add(:base, "Borrower has active loan") if borrower.loans.where(status: 1).exists?
    errors.add(:base, "cannot exceed 30 days") if (return_deadline - borrowed_at).to_i > 30
  end
end
