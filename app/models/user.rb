class User < ActiveRecord::Base
  include Renderable

  validates(:name,
            presence: true,
            format: /\A[a-zA-Z0-9_\-]+\Z/,
            uniqueness: true,
            length: { minimum: 3, maximum: 240 },
            username_not_reserved: true
           )

  validates(:email,
           presence: true,
           uniqueness: { case_sensitive: false },
           email_format: true
          )

  has_secure_password
end
