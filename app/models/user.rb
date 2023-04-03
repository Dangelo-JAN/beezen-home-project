class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  belongs_to :role, optional: true
  has_many :tasks, dependent: :destroy
  has_many :alerts, through: :tasks

  before_save :assign_role

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.lastname = auth.info.lastname # assuming the user model has a lastname
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def assign_role
    self.role = Role.find_by name: 'user' if role.nil?
  end

  def admin?
    role_id == 1
  end

  def current?
    role_id == 2
  end

  def visitor?
    role_id == 3
  end
end
