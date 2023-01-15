class Admin < ApplicationRecord
  has_many :browses, dependent: :destroy
  has_secure_password
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: ["admin"]}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
