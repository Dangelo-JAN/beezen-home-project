class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :role, optional: true
  has_many :tasks, dependent: :destroy
  has_many :alerts, through: :tasks

  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'user' if role.nil?
  end

  def admin?
    self.role.name == 'admin'
  end

  def current?
    self.role.name == 'user'
  end

  def visitor?
    self.role.name == 'visitor'
  end
end
