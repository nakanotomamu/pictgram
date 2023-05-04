class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email,presence: true, format: { with: /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/ }
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'
end