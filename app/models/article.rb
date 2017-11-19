class Article < ApplicationRecord
  acts_as_votable
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments
end
