class LinksController < ApplicationController
before_action :find_link, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
before_action :authenticate_user!, except: [:index,:show]

  def index
    @links = Link.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to links_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to link_path(@link)
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end

  def upvote
    @link.liked_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @link.downvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end

  def find_link
    @link = Link.find(params[:id])
  end
end
