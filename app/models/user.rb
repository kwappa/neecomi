class User < ActiveRecord::Base
  validates(:name,
            presence: true,
            format: /\A[a-zA-Z0-9_\-]+\Z/,
            uniqueness: true,
            length: { minimum: 3, maximum: 240 }
           )

  validates(:email,
           presence: true,
           uniqueness: { case_sensitive: false },
           email_format: true
          )

  has_secure_password
end
