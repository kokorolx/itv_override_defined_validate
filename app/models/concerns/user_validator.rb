module UserValidator
  extend ActiveSupport::Concern # this line must be before
  include ActiveModel::Validations

  included do
    clear_validators! # remove all validators

    # declare new validators
    validates :name, presence: false, length: { minimum: 5, maximum: 10 }
  end
end
