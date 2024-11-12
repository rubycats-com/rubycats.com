module TurboFramable
  extend ActiveSupport::Concern
  include Turbo::FramesHelper

  def call
    @_already_wrapped ? super : wrapped_call
  end

  def replace
    [ turbo_frame_id, self ]
  end

  private

  def wrapped_turbo_frame_id
    defined?(turbo_frame_id) ? turbo_frame_id : raise("Mast define turbo_frame_id in #{self.class}")
  end

  def turbo_framable?
    true
  end
end
