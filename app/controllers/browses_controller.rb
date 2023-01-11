class BrowsesController < ApplicationController
  before_action :logged_in_admin

    def index
      @admin_id = current_admin.id
      @browses = Browse.all
    end
    # def index
    #     @browses = browse.where("browses.browse_title LIKE ?",["%#{params[:query]}%"])
    #     # @browses = browse.all
    #   end
    def new
      @browse = Browse.new
    end
    
    def show
       @browse = Browse.find(params[:id])
    end
    
    def create    
      @admin_id = params[:admin_id]
      # puts "this is Admin id #{@admin} "
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
    
      # def search
      #   # @query = params[:query]
      #   @browse_search = browse.where("browses.browse_title LIKE ?",["%#{params[:query]}%"])
      # end
    
    private
    def browse_params
      params.require(:browse).permit(:type, :name, :link, :size, :uploaded_by, :created_at, :files)
    end
end
