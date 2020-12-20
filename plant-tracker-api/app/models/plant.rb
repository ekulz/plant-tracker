class Plant < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
end
