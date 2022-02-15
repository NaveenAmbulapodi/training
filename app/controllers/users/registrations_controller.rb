class Users::RegistrationsController < Devise::RegistrationsController
    before_action :sign_up_params, only: [:create]
    before_action :account_update_params, only: [:update]
    def new
    puts "\n\n...Im in ur local...\n\n"
    build_resource({})
    resource.build_profile
    respond_with self.resource
    end
    def create
    super
    end
    def update
    super
    end
    private
    def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
    params.require(:user).permit(:email, :password, :password_confirmation,
    profile_attributes: [:id, :name, :address])
    end
    def account_update_params
    params.require(:user).permit(:current_password, :email, :password,
    :password_confirmation, profile_attributes: [:id, :name, :address])
    end
    end