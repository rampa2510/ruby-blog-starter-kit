# frozen_string_literal: true

if Rails.env.development?
  AdminUser = Struct.new(:email, :password, :first_name, :last_name)
  Rails.application.config.after_initialize do
    admin = AdminUser.new('tech@getsaral.com', ENV['ADMIN_PASSWORD'], 'Admin', 'User')
    user = User.find_or_initialize_by(email: admin.email)
    user.password = admin.password
    user.password_confirmation = admin.password
    user.role = 'admin'
    user.first_name = admin.first_name
    user.last_name = admin.last_name
    # Set default values for new fields
    user.linkedin_url ||= ''
    user.twitter_url ||= ''
    user.description ||= 'Admin user'

    # Always attach a default profile picture
    default_image_path = Rails.root.join('app', 'assets', 'images', 'default_profile.webp')

    # If the user already exists and has a profile picture, we don't want to overwrite it
    unless user.profile_picture.attached?
      user.profile_picture.attach(io: File.open(default_image_path), filename: 'default_profile.webp',
                                  content_type: 'image/webp')
    end

    user.save!
  end
end
