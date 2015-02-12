class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # accepts_nested_attributes_for :doses,
  #   :allow_destroy => true,
  #   :reject_if     => :all_blank

  validates :name, presence: true, uniqueness: true
end
