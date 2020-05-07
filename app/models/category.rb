class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates_uniqueness_of :name

  default_scope -> { order(:name) }
end
