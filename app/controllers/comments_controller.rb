class CommentsController < ApplicationController

  def create

    @humster = Humster.find(params[:humster_id])
    @comment = @humster.comments.build(comment_params)
    @comment.user_id = current_user.id


    if @comment.save
     redirect_back(fallback_location: root_path)
    else

     redirect_back(fallback_location: root_path)
    end

  end

  

  private
  def comment_params
    params.require(:comment).permit(:content,:humster_id)
  end

end
