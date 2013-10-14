class SessionsController < Devise::SessionsController  
  def create  
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        if params[:user][:email].nil?
          render :status => 400,
                 :json => {:status => 400, :message => 'User request must contain the user email.'}
          return
        elsif params[:user][:password].nil?
          render :status => 400,
                 :json => {:status => 400,:message => 'User request must contain the user password.'}
          return
        end                 

      
        resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
            return sign_in(resource_name, resource)
        
      }
    end  
  end  
  
  def destroy  
    super  
  end  
  
  def sign_in(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:status => 200 , :email => resource.email ,:auth_token =>resource.authentication_token}
  end
 
  def failure
    #return render:json => {:success => false, :errors => ["Login failed."]}
    return render :json => {:status => 400,  :message => 'Login failed.'}
  end
    
end  