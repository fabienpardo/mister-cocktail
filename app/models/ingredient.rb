class Ingredient < ActiveRecord::Base
  has_many :doses

  accepts_nested_attributes_for :doses

  validates :name, presence: true, uniqueness: true
end
