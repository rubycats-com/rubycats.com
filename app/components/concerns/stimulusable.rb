module Stimulusable
  extend ActiveSupport::Concern

  # Use Stimulus params
  #
  # stimulus[:target] String
  # stimulus[:outlets] Array if {key: value}
  # stimulus[:values] Array if {key: value}
  # stimulus[:classes] Array if {key: value}

  def call
    @_already_wrapped ? super : wrapped_call
  end

  def stimulus
    defined?(super) ? super : {}
  end

  def component_stimulus_controller
    self.class
      .name
      .split("::")
      .map { |c| c.split(/(?=[A-Z])/) }
      .map { |c| c.one? ? c : c.join("-") }
      .join("--")
      .downcase
  end

  # view helpers

  def stimulus_controller(controller)
    { "data-controller": lower_camelize(controller) }
  end

  def stimulus_target(target)
    { "data-#{component_stimulus_controller}-target": lower_camelize(target) }
  end

  def stimulus_action(event, method)
    { "data-action": "#{event}->#{component_stimulus_controller}##{method}" }
  end

  def stimulus_outlet(name, value)
    { "data-#{component_stimulus_controller}-#{dasherize(name)}-outlet": dasherize(value) }
  end

  def stimulus_value(name, value)
    { "data-#{component_stimulus_controller}-#{dasherize(name)}-value": dasherize(value) }
  end

  def stimulus_css_class(name, value)
    { "data-#{component_stimulus_controller}-#{dasherize(name)}-class": dasherize(value) }
  end

  def stimulus_outlets(**outlets)
    { **outlets.map { |k, v| stimulus_outlet(k, v) }.inject(:merge) }
  end

  def stimulus_values(**values)
    { **values.map { |k, v| stimulus_value(k, v) }.inject(:merge) }
  end

  def stimulus_css_classes(**css_classes)
    { **css_classes.map { |k, v| stimulus_css_class(k, v) }.inject(:merge) }
  end

  private

  def stimulusable_data_controller
    stimulus_controller(component_stimulus_controller)
  end

  def stimulusable_data_target
    stimulus[:target].present? ? stimulus_target(stimulus[:target]) : {}
  end

  def stimulusable_data_outlets
    stimulus[:outlets].present? ? stimulus_outlets(**stimulus[:outlets]) : {}
  end

  def stimulusable_data_values
    stimulus[:values].present? ? stimulus_values(**stimulus[:values]) : {}
  end

  def stimulusable_data_css_classes
    stimulus[:css_classes].present? ? stimulus_css_classes(**stimulus[:css_classes]) : {}
  end

  def stimulusable_data
    {
      **stimulusable_data_controller,
      **stimulusable_data_target,
      **stimulusable_data_outlets,
      **stimulusable_data_values,
      **stimulusable_data_css_classes
    }
  end

  def lower_camelize(key)
    key.to_s.camelize(:lower)
  end

  def dasherize(key)
    key.to_s.dasherize
  end

  def stimulusable?
    true
  end
end
