class Category < ApplicationRecord
    has_and_belongs_to_many :products #many-to-many relations to product
end
