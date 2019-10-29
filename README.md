# Requirements:
- [x] Write a module which can override all validates in class User

```ruby
class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 2 }
  validates_numericality_of :age

  # validate by ::Proc
  validate do
    errors.add(:name, 'Must be friends to leave a x') if true
  end

  include UserValidator
end


```

- [x] Re-validate all attributes :name to presence: false, length: { minimum: 5, maximum: 10 }
- [x] Remove all validate by Proc
