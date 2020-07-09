class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 2 }
  validates_numericality_of :age

  # validate by ::Proc
  validate do
    errors.add(:name, 'Must be friends to leave a x') if true
  end

  validate do
    errors.add(:name, 'I want to remove this validate') if true
  end

  include UserValidator # it will override the validation declared
end
