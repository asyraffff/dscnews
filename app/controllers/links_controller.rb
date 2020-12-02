class LinksController < ApplicationController
before_action :find_link, only: [:show, :edit, :update, :destroy]
    def index
        @links = Link.all.order("created_at DESC")
    end

    def new
        @link = Link.new
    end

    def create
        @link = Link.new(link_params)
        if @link.save
            redirect_to root_path, notice: "Succesfully created link"
        else
            return "new"
        end
    end

    def show
        # @link = Link.find(params[:id])
    end

    def edit
        # @link = Link.find(params[:id])
    end

    def update
        # @link = Link.find(params[:id])
        if @link.update(link_params)
            redirect_to link_path(@link), notice: "Succesfully updated link"
        else
            render 'edit'
        end
    end

    def destroy
        # @link = Link.find(params[:id])
        @link.destroy

        redirect_to root_path, notice: "Succesfully deleted link"
    end

    private
    def link_params
        params.require(:link).permit(:title, :url)
    end

    def find_link
        @link = Link.find(params[:id])
    end
end
