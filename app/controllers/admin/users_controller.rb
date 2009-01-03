class Admin::UsersController < AdminController
  before_filter :find_user, :except => [:index]
  before_filter :check_user, :only => :destroy
  
  def find_user
    @user = User.find(params[:id])
  end
  
  # Malke sure we don't delete the last one or ourselves
  def check_user
    redirect_with_flash("You may not delete this user. It is you!", admin_users_url) and return if current_user == @user
    redirect_with_flash("You may not delete this user. It is the last one!") and return if User.all.length <= 1
  end
  # GET /users
  # GET /users.xml
  def index
    @user_search = UserSearch.new(params[:user_search])
    @users = @user_search.users.paginate :page => params[:page]
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /users/1/edit
  def edit

  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update

    @user.roles = Role.find(params[:user][:role_ids]) if params[:user][:role_ids]
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to admin_users_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def approve
    @user.approve! 
    redirect_to admin_users_path
  end
  
  def deny
    @user.deny! 
    redirect_to admin_users_path
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy

    @user.destroy
  
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.xml  { head :ok }
    end
  end

end
