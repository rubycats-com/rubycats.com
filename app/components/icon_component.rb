class IconComponent < ApplicationComponent
  param :icon, Dry::Types["strict.symbol"]
  option :inline, default: -> { false }

  def call
    raw(File.read("app/assets/images/tabler-icons/#{icon_file_name}.svg"))
  end

  private

  def icon_file_name
    icon.to_s.dasherize
  end
end
