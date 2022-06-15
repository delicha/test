class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :hobby, :character, :generation, :point, :image, sub_images: []])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :hobby, :character, :generation, :point, :image, sub_images: []])
    end

    def after_sign_in_path_for(resource)
      users_path # ログイン後に遷移するpathを設定
    end
    
    def after_sign_out_path_for(resource)
      root_path # ログアウト後に遷移するpathを設定
    end
end
