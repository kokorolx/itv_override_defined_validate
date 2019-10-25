class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 2 }
end
