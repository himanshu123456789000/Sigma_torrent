class AdminsController < ApplicationController
    def show
      @admin = Admin.find(params[:id])
      if @admin.status == "superadmin"
        flash[:notice] = "Logged in as SuperAdmin"
        @admins = Admin.all
      else
        flash[:notice] = "logged in as Admin"
      end
      
    end
    
    def new
      @admin = Admin.new
    end
    
    def create
      @admin = Admin.new(admin_params)
      respond_to do |format|
        if @admin.save
          format.html { redirect_to admin_url(@admin), notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @admin }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end
    def destroy
      @admin = Admin.find(params[:id])
      @admin.destroy
    
      redirect_to admin_path
    end
    
    private
    
    def admin_params
      params.require(:admin).permit(:name, :status, :email, :password, :password_confirmation)
    end
end
