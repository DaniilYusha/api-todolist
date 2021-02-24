class User < ApplicationRecord
  MIN_USERNAME_LENGTH = 3
  MAX_USERNAME_LENGTH = 50
  PASSWORD_LENGTH = 8
  PASSWORD_FORMAT = /\A[a-zA-z0-9]+\z/.freeze

  has_secure_password
  has_many :projects

  validates :username, presence: true, uniqueness: true, length: { minimum: MIN_USERNAME_LENGTH,
                                                                   maximum: MAX_USERNAME_LENGTH }
  validates :password, presence: true, length: { is: PASSWORD_LENGTH },
                       format: { with: PASSWORD_FORMAT,
                                 message: I18n.t('validations.password_format') }
end
