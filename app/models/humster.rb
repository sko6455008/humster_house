class Humster < ApplicationRecord
	belongs_to :user
    has_one_attached :image

    with_options presence: true do
    validates :title
    validates :body
  end

    has_many :comments, dependent: :destroy

    has_many :category_relations, dependent: :destroy
    has_many :categories,through: :category_relations, dependent: :destroy


end
