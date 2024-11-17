class Public::RegistrationsController < Devise::RegistrationsController
    def after_sign_in_path_for(resource)
      post_images_path
    end
    def after_sign_out_path_for(resource)
      about_path
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
end
