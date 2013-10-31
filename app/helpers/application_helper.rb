module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def dotter(body)
     if body =~/[^(\.$)]/ && !$1.nil?
       body << "..."
     elsif body =~/(\w$)/ && !$1.nil?
       body << "..."
     else
       body
     end
  end
end
