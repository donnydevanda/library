# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.create(title: "Flying Dutchman", isbn: "UTD-001-003", stock: 5)
Book.create(title: "Ginger Hair", isbn: "UTD-006-008", stock: 3)
Book.create(title: "The SAF", isbn: "UTD-011-014, stock: 5", stock: 0)
Borrower.create(name: "Amad Light", email: "amad_light@utd.com")
Borrower.create(name: "Bruno Midway", email: "brunmid@utd.com")
Borrower.create(name: "Casemiro Brazillian", email: "cdsbr@utd.com")