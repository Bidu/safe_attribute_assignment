require 'active_support/concern'

module SafeAttributeAssignment
  extend ActiveSupport::Concern

  def assign_attributes(params = {})
    (params || {}).each do |attr, value|
      public_send("#{attr}=", value) if respond_to?("#{attr}=")
    end
  end
end
