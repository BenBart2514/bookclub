class User < ApplicationRecord
  after_create :set_role

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  

  def set_role
    add_role :user if roles.blank?
  end
end
