class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w[admin writer] }

  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  # Use Rails 7's built-in Active Record Validations for URLs
  validates :linkedin_url, :twitter_url,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                      message: 'must be a valid URL' }, allow_blank: true

  has_one_attached :profile_picture
  # Validate profile picture
  validates :profile_picture, content_type: ['image/png', 'image/jpeg', 'image/jpg'],
                              attached: false

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

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
