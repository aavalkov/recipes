class Recipe < ActiveRecord::Base
  validates :name, presence: :true
  validates :text, presence: :true

  has_and_belongs_to_many :tags

  def self.find_by_search(query)
    results = Recipe.basic_search(query)
  end
end
