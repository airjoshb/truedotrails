class CreateAdminUserService
    def call
      user = User.find_or_create_by!(email: Rails.application.credentials[Rails.env.to_sym][:admin_user_email]) do |user|  
        user.first_name = Rails.application.credentials[Rails.env.to_sym][:admin_user_first_name]
        user.last_name = Rails.application.credentials[Rails.env.to_sym][:admin_user_last_name]
        user.password = Rails.application.credentials[Rails.env.to_sym][:admin_user_password]
        user.password_confirmation = Rails.application.credentials[Rails.env.to_sym][:admin_user_password]
        user.admin = true
      end
    end
  end
  