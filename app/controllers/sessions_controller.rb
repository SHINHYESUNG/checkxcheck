class SessionsController < Devise::SessionsController  
  def create  
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

          if params[:user][:email]
            duplicate_user = User.find_by_email(params[:user][:email])
            unless duplicate_user.nil?
              render :status => 409,
                     :json => {:status=>409, :message => 'Duplicate email. A user already exists with that email address.'}
              return
            end
          end
        
          if params[:user][:password].length <8 
            render :status => 400,
                   :json => {:status => 400, :message => 'Password is too short (minimum is 8 characters).'}
            return
          end    
        
          if params[:user][:password]!= params[:user][:password_confirmation]
            render :status => 400,
                   :json => {:status => 400, :message => 'Password does not match confirmation.'}
            return
          end 
                 

          @user = User.create(params[:user])

          if @user.save
          
             render :json => {:status=>200 ,:message =>@user.authentication_token, :user => @user }
          else
            render :status => 400,
                   :json => {:status=>400, :message => @user.errors.full_messages}
          end
        }
      end
    end
  end  
  
  def destroy  
    super  
  end  
end  