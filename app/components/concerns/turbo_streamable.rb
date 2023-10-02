module TurboStreamable
  extend ActiveSupport::Concern
  include Turbo::StreamsHelper

  def call
    @_already_wrapped ? super : wrapped_call
  end

  def broadcast_replace!
    @_render_from_broadcast_replace = true

    Turbo::StreamsChannel.broadcast_replace_to(
      wrapped_turbo_stream_name, target: wrapped_turbo_frame_id, content: ApplicationController.render(self, layout: false)
    )
  end

  private

  def wrapped_turbo_frame_id
    defined?(turbo_frame_id) ? turbo_frame_id : raise("Mast define turbo_frame_id in #{self.class}")
  end

  def wrapped_turbo_stream_name
    defined?(turbo_stream_name) ? turbo_stream_name : "#{wrapped_turbo_frame_id}_stream"
  end

  def turbo_streamable?
    true
  end
end
