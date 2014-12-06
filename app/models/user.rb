class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  include Renderable

  validates(:name,
            presence: true,
            format: /\A[a-zA-Z0-9_\-]+\Z/,
            uniqueness: true,
            length: { minimum: 3, maximum: 240 },
            username_not_reserved: true
           )
end
