class User < ApplicationRecord
  mount_uploader :icon, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google]

  validates :name, presence: true

  has_many :events, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :groups, through: :joins
  has_many :attends, dependent: :destroy
  has_many :contacts, dependent: :destroy

  # oauth認証
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    user ||= User.new(
      name: auth.info.name,
      email: auth.info.email,
      provider: auth.provider,
      uid: auth.uid,
      password: Devise.friendly_token[0, 20]
    )
    user.save
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

end
