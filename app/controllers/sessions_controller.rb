class SessionsController < Devise::SessionsController  
  before_filter :authenticate_user!, :except => [:create, :destroy]
  
  def create  
    respond_to do |format|
     
      format.html {
        super
           } 
                  
      format.json {
        if params[:user][:email].nil?
          render :json => {:status => 400, :message => 'User request must contain the user email.'}
          return
        elsif params[:user][:password].nil?
          render :json => {:status => 400,:message => 'User request must contain the user password.'}
          return
        end                 
          
        resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
        return sign_in_and_redirect(resource_name, resource)
      }
    end  
  end  
  
  def destroy  
   respond_to do |format|
    format.html {
      super
    }
    format.json {
  
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

      if signed_out
       render :json => {:message => 'Successfully Signed out'}
      else 
        render :json => {:message => 'Sign out failed'}
      end
      
      
      # resource = User.find_for_database_authentication(:email => params[:user][:email])
      # 
      # if resource.nil?
      #   render :json=> {:message => 'Sign out failed'}
      # elsif 
      #    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      #    # resource.authentication_token = nil
      # #    resource.save
      #     if signed_out
      #       render :json=> {:message => 'Signed out'}
      #     end
      #  end  
      
    }
    
    end 
  end  
  
  protected
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:status => 200 , :email => resource.email ,:auth_token =>resource.authentication_token}
  end
   
  def failure
    #return render:json => {:success => false, :errors => ["Login failed."]}
    return render :json => {:status => 400,  :message => 'Sign in failed.'}
  end
    
end  