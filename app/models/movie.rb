class Movie < ApplicationRecord
  has_many :bookmarks  # <-- NO dependent option here

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
