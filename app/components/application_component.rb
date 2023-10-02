class ApplicationComponent < ViewComponent::Base
  extend Dry::Initializer

  def wrapped_call
    @_already_wrapped = true

    concat(turbo_stream_from(wrapped_turbo_stream_name)) if turbo_streamable? && !@_render_from_broadcast_replace

    concat(
      wrapped_tag(**wrapped_turbo_data, **wrapped_stimulusable_data) do
        call
      end
    )
  end

  # helpers

  def component_name
    # ToDo: self.class.identifier ?
    self.class.name.underscore
  end

  private

  def wrapped_turbo_frame_id
    # ToDo: rename to wrapped_id ?
    turbo? ? turbo_frame_id : id
  end

  def wrapped_stimulusable_data
    stimulusable? ? stimulusable_data : {}
  end

  def wrapped_turbo_data
    turbo_framable? ? {"data-turbo": true} : {}
  end

  def wrapped_tag(*, **, &block)
    turbo_framable? ? turbo_frame_tag(wrapped_turbo_frame_id, *, **, &block) : tag.div(*, id: wrapped_turbo_frame_id, **, &block)
  end

  def id
    # ToDo: This is the wey to set component id if it not turbo_frame. It is really need?
    nil
  end

  def turbo_framable?
    defined?(super)
  end

  def turbo_streamable?
    defined?(super)
  end

  def turbo?
    turbo_framable? || turbo_streamable?
  end

  def stimulusable?
    defined?(super)
  end

  # for Devise helpers
  def main_app
    Rails.application.class.routes.url_helpers
  end
end
