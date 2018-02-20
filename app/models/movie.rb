class Movie < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :movie_categories
  has_many :categories, through: :movie_categories
end
