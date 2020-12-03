class CommentsController < ApplicationController
before_action :authenticate_user!

    def create
        @link = Link.find(params[:link_id])
        @comment = @link.comments.create(comment_params)
        @comment.link_id = @link.id
        @comment.user_id = current_user.id
        if @comment.save
         redirect_to link_path(@link)
        else
         render 'new'
        end
    end

    def destroy
        @link = Link.find(params[:link_id])
        @comment = Comment.find[params[:id]]
        @comment.destroy

        redirect_to link_path(@link)
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
