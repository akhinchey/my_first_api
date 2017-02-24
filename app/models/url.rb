class Url < ApplicationRecord

  has_many :h_one_tags
  has_many :h_two_tags
  has_many :h_three_tags
  has_many :internal_links
  accepts_nested_attributes_for :h_one_tags, :h_two_tags, :h_three_tags, :internal_links
  validates :name, presence: true
  
end
