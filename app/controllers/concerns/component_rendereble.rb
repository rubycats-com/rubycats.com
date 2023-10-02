module ComponentRendereble
  extend ActiveSupport::Concern

  private

  def render_component_replace(component)
    # render_component_replace PlayComponent.new(tournament: @tournament)
    #
    # render turbo_stream.replace(
    #   dom_id(@tournament, :play),
    #   PlayComponent.new(tournament: @tournament)
    # )
    render(turbo_stream: turbo_stream.replace(*component.replace))
  end
end
