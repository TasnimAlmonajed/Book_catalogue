class Book < ApplicationRecord
  has_many :authorbooks
  has_many :authors, through: :authorbooks

  validates :title, presence: { message: "field cannot be empty"}
  validates :isbn, presence: { message: "field cannot be empty"}, uniqueness: true
  validates :short_description, presence: { message: "field cannot be empty"}
end
