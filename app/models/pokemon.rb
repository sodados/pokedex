class Pokemon < ApplicationRecord
  validates :number, presence: true
  validates :name, presence: true
  validates :genus, presence: true
  validates :flavor_text, presence: true
end
