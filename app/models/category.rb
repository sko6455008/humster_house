class Category < ApplicationRecord
	has_many :cotegory_relations, dependent: :destroy
	has_many :humsters,through: :category_relations, dependent: :destroy
end
