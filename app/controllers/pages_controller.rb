class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def show
    # It's don't create @page for root page
    @page = Page.find_or_create_by!(slug: current_page) if lookup_context.template_exists?(current_page, false)
    render current_page
  end
end
