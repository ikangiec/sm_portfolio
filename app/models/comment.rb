# A comment is a text entry about a post
class Comment < ActiveRecord::Base
# No longer needed for Rails 4 b/c of strong parameters gem but keeping for reference
#  attr_accessible :approved,
#                  :author,
#                  :author_email,
#                  :author_url,
#                  :content,
#                  :referrer,
#                  :user_agent,
#                  :user_ip
#                  :post_id
  validates :content, presence: true
  validates :author_email, presence: true
  validates :author, presence: true
  belongs_to :commentable, polymorphic: true
end
