# frozen_string_literal: true

if Rails.env.development?
  AdminUser = Struct.new(:email, :password)

  Rails.application.config.after_initialize do
    admin = AdminUser.new('admin@example.com', 'password')

    user = User.find_or_initialize_by(email: admin.email)
    user.password = admin.password
    user.password_confirmation = admin.password
    user.role = 'admin'
    user.save!
  end
end
