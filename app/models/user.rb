class User < ApplicationRecord
  validates :name, presence: true
  validates :email,presence: true
  validates :password,length:{minimum: 8,maximum: 23}
  validates :password, format: { with: /\A(?=.[a-z])(?=.[@])(?=.*?\d)[a-z\d]{0,15}+\z/i }
  has_secure_password
end

 
