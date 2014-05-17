class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  belongs_to :author, class_name: "User"
end
