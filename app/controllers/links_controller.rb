class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all
  end

  def show
    @link = Link.find_by(slug: params[:slug])
    redirect_to @link.given_url
  end

  def create
    @link = Link.new(link_params)
    @link.save
    redirect_to root_url, notice: 'Link was successfully created.'
  end

  def destroy
    @link = Link.find_by(id: params[:id])
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private
    def link_params
      params.require(:link).permit(:given_url)
    end
end
