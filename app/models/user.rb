class User < ActiveRecord::Base
  validates :name, presence: true, format: /\A[a-zA-Z0-9_\-]+\Z/

  has_secure_password
end
