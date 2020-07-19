class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :humster

  validates :content,presence: true
  
end
