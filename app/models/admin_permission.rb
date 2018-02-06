class AdminPermission < ApplicationRecord
  belongs_to :admin
  belongs_to :permission
end
