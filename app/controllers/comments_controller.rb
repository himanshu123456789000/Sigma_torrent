class CommentsController < ApplicationController
  def index
    @comments =Comment.all
  end
  def new
    @comment=Comment.new
    @browse_id = (params[:browse_id]).to_i
    @comments=Comment.where(browse_id: @browse_id)
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.browse_id=(@comment.browse_id).to_i
    if @comment.save
        redirect_to root_path
        flash[:notice] = 'Comment Uploaded successfully'
      else
        redirect_to root_path
      end
  end
    
  def destroy
    @browse = Browse.find(params[:browse_id])
    @comment = @browse.comments.find(params[:id])
    if @comment.destroy
      redirect_to "/comments/new?browse_id=#{@browse.id}", status: :see_other
      flash[:notice] = "Deleted Successfully"
    end
  end
    
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :browse_id )
  end
end
