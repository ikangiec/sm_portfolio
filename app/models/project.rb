class Project < ActiveRecord::Base
  validates :title, length: { in: 4..255 }
  validates :description, presence: true
end
