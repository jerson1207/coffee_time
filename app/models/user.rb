class User < ApplicationRecord
  # before_save not working
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :orders

  has_one_attached :avatar

  has_many :addresses

  validates :contact, numericality: { only_integer: true }, length: { in: 9..11}

  def set_default_role
    self.role ||= :user
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
