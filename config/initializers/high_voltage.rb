HighVoltage.configure do |config|
  config.home_page = "home"
  config.route_drawer = OpenStruct.new(
    match_attributes: {
      "/#{HighVoltage.content_path}*id" => "pages#show",
      :as => :page,
      :format => false
    }
  )
end
