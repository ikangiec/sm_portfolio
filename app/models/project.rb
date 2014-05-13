class Project < ActiveRecord::Base
  validates :description, presence: true
  validates :title, length: { in: 4..255 }
end
