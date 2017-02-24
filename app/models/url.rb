class Url < ApplicationRecord

  has_many :h1_tags
  has_many :h2_tags
  has_many :h3_tags
  has_many :internal_links
  accepts_nested_attributes_for :h1_tags, :h2_tags, :h3_tags, :internal_links
  validates :name, presence: true
  
end
