class Ingredient < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  before_destroy :check_for_cocktails

  private

  def check_for_cocktails
    if cocktails.count > 0
      errors.add_to_base("cannot delete ingredient while cocktail exist")
      return false
    end
  end
end
