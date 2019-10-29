module UserValidator
  extend ActiveSupport::Concern # this line must be before
  include ActiveModel::Validations

  included do
    p 'before remove'
    p _validators
    _validate_callbacks.each do |callback|

      # for more details about callback.filter and callback.raw_filter
      # see https://github.com/rails/rails/blob/a8dfec903bd8cd3b7df9f9d5fbb7100520049302/activesupport/lib/active_support/callbacks.rb#L306

      # remove validates presence: true
      if callback.filter.is_a?(ActiveRecord::Validations::PresenceValidator) && callback.raw_filter.respond_to?(:attributes)
        _validate_callbacks.delete(callback)
      end

      # remove validate by ::Proc
      # I think dont need to check `callback.filter.is_a?(Numeric)`
      if callback.raw_filter.is_a?(Proc) && callback.filter.is_a?(Numeric) && callback.raw_filter.respond_to?(:attributes)
        _validate_callbacks.delete(callback)
      end
    end
    p 'after remove'
    p _validators
  end
end
