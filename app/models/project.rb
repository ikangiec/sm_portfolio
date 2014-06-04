class Project < ActiveRecord::Base
  validates :title, length: { in: 4..255 }
  validates :description, presence: true
  has_many :comments, as: :commentable
end
