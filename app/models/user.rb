class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w[admin writer] }

  # Helper methods to check user roles
  def admin?
    role == 'admin'
  end

  def writer?
    role == 'writer'
  end

  # Override Devise's method to allow creation of users without password
  def password_required?
    new_record? ? false : super
  end
end
