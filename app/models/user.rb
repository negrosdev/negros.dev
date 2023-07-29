class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  enum roles: { student: 0, staff: 2, writer: 4, reviewer: 6, admin: 8 }

  validates :email, :password, :roles, presence: true
end
