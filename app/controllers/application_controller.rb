class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  #def set_current_user
  #  User.current = current_user
  #end

  def time_later
    @time_later = Time.now
    if ((session[:time_now] + 5) >= @time_later)
      @time_too_fast = "Too fast data entry"
    end
  end

  def hidden_field
    #p params[:hidden]
    if (params[:hidden] != '' && params[:hidden] != nil)
      p params[:hidden]
      @hidden = "Hidden Field Changed"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :name, :last_name, :email, :password, :password_confirmation
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
         u.permit :name, :last_name, :email, :password, :password_confirmation, :current_password
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    #puts "))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"
    request.referrer
  end
end
