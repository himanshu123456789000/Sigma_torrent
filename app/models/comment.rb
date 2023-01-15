class Comment < ApplicationRecord
  belongs_to :browse
  validates :commenter, presence: true
  validates :body, presence: true
end
