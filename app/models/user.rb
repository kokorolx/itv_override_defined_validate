class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 2 }
  validates_numericality_of :age

  include UserValidator # it will override the validation declared
end
