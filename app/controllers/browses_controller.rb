class BrowsesController < ApplicationController
    def index
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
        # @browse = Browse.find(params[:id])
        file_data = params[:files]
          if file_data.respond_to?(:read)
            xml_contents = file_data.read
          elsif file_data.respond_to?(:path)
            xml_contents = File.read(file_data.path)
          else
            logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
          end
      end
    
      def create
        @browse = Browse.new(browse_params)
    
        if @browse.save
          redirect_to @browse
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
        @browse = browse.find(params[:id])
        @browse.destroy
    
        redirect_to root_path, status: :see_other
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
