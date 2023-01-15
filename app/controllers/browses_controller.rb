class BrowsesController < ApplicationController
  before_action :logged_in_admin
  before_action :authorize, only: [:edit, :update]

  def index    
    @admin_id = current_admin.id
    @admin_detail = Admin.find(@admin_id)
    @admin_status = @admin_detail.status
    if @admin_status == "admin"
      @browses = Browse.where(admin_id: @admin_id)
      @browses = @browses.where("browses.name LIKE ?",["%#{params[:query]}%"])
    else
      @browses = Browse.where("browses.name LIKE ?",["%#{params[:query]}%"])
    end
  end
      
  def new
    @browse = Browse.new
  end
      
  def show
    @browse = Browse.find(params[:id])
  end
      
  def create    
    @admin_id = params[:admin_id]
    @browse = Browse.new(browse_params)
    @browse.admin_id = current_admin.id
    if @browse.save
      flash[:notice] = 'File Uploaded successfully'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
      
  def edit
    @browse = Browse.find(params[:id])
  end
      
  def update
    @browse = Browse.find(params[:id])
    if @browse.update(browse_params)
      redirect_to @browse
    else
      render :edit, status: :unprocessable_entity
    end
  end
      
  def destroy
    @browse = Browse.find(params[:id])
    @browse.destroy
      
    redirect_to root_path
  end
      
  private
  def browse_params
    params.require(:browse).permit(:attachment, :created_at, :query, :name)
  end
end
