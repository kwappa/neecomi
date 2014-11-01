class User < ActiveRecord::Base
  validates(:name,
            presence: true,
            format: /\A[a-zA-Z0-9_\-]+\Z/,
            uniqueness: true
           )

  has_secure_password
end
