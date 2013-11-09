class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :check_if_article


  def check_if_article
    #puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{request.fullpath}"
    if request.fullpath =~ /\/articles\/\d+/
      session[:back_to] = request.fullpath  # see after_sign_in_path_for and after_sign_out_path_for
      #puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #{session[:back_to]}"
    end
  end

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

  def stored_location_for(loc)
    nil
  end

  def after_sign_in_path_for(resource)
    #session[:user_return_to] || root_path
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
       #if request.referer == sign_in_url
       if !session[:back_to].nil?
         session[:back_to]
       else
         #stored_location_for(resource) || request.referer || root_path
         super
       end
  end

  def after_sign_out_path_for(resource_or_scope)
    session[:back_to] = nil
    #puts "session signed out"
    request.referrer
  end
end
