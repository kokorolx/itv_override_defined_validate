# Requirements:
- [ ] Write a module which can override all validates in class User

```ruby
class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 2 }
end

```

- Re-validate all attributes :name to presence: false, length: { minimum: 5, maximum: 10 }
