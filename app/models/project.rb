class Project < ActiveRecord::Base
  validates :title, length: { in: 4..255 }
  validates :description, presence: true
  has_many :comments, as: :commentable
  dragonfly_accessor :image # defines a reader/writer for image
  # dragonfly_accessor :image do
  #   storage_options do |attachment|
  #     {
  #       path: "projects/#{some_instance_method}/#{rand(100)}",
  #       headers: {"x-amz-acl" => "public-read-write"}
  #     }
  #   end
  # end
end
