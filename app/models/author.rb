class Author < ApplicationRecord
  has_many :authorbooks
  has_many :books, through: :authorbooks

  validates :name, presence: { message: "field cannot be empty"}
end
