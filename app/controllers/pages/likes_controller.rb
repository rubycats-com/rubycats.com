class Pages::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page

  def create
    begin
      @page.likes.create(user: current_user)
    rescue ActiveRecord::RecordNotUnique
      nil
    end
    render_component_replace Page::LikeComponent.new(page: @page, user: current_user)
  end

  def destroy
    @page.likes.find_by(user: current_user)&.destroy
    render_component_replace Page::LikeComponent.new(page: @page, user: current_user)
  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end
end
