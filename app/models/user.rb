class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable, 
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable
end
