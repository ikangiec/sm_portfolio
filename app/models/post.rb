class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, length: { minimum: 5 }, presence: true
end
