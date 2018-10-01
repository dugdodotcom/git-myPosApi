class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :jwt_authenticatable,
         :validatable,
         :rememberable,
         jwt_revocation_strategy: JwtBlacklist
end
