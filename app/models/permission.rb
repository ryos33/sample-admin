class Permission < ApplicationRecord
  acts_as_paranoid sentinel_value: '1000-01-01'
  enum permission_div: { default: 0, custom: 1 }
end
