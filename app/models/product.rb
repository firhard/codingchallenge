class Product < ApplicationRecord
    has_and_belongs_to_many :categories #many-to-many relations to category
end
