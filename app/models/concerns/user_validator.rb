module UserValidator
  extend ActiveSupport::Concern # this line must be before
  include ActiveModel::Validations

  included do
    p 'before remove'
    p _validators
    _validate_callbacks.each do |callback|
      binding.pry
      if callback.filter.is_a?(ActiveRecord::Validations::PresenceValidator) && callback.raw_filter.respond_to?(:attributes)
        _validate_callbacks.delete(callback)
      end

    end
    p 'after remove'
    p _validators
  end
end
