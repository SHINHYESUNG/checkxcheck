class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :store_location
  
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        !request.xhr?) # don't store ajax calls
        if request.format == "text/html" || request.content_type == "text/html"
          session[:previous_url] = request.fullpath
          session[:last_request_time] = Time.now.utc.to_i
        end
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  
  def after_update_path_for(resource)
    session[:previous_url] || root_path
  end
  
  # def after_sign_out_path_for(resource)
 #    session[:previous_url] || root_path
 #  end
  
end
