class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    if @admin.status == "superadmin"
      flash[:notice] = "Logged in as SuperAdmin"
      @admins = Admin.where("admins.name LIKE ?",["%#{params[:query]}%"])
    else
      flash[:notice] = "logged in as Admin"
    end
    if logged_in?  
      unless session[:admin_id] == @admin.id 
        flash[:notice] = "Don't try to act smart!"
        redirect_to admin_path(session[:admin_id])
        return
      end 
    else
      redirect_to login_path
    end   
  end
      
  def new
    @admin = Admin.new
  end
      
  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to login_path, notice: "Admin was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.status == "superadmin"
      flash[:notice] = "You can't destroy yourself"
      redirect_to admin_path
      flash[:notice] = "You can't destroy yourself"
    else
      @admin.destroy
      redirect_to admin_path
    end
  end
      
  private    
  def admin_params
    params.require(:admin).permit(:name, :status, :email, :password, :password_confirmation)
  end
end
