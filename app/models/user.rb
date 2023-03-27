class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :role, optional: true
  has_many :tasks, dependent: :destroy

  before_save :assign_role

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
