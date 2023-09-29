class RouteDrawers
  def self.match_attributes
    {
      "/#{HighVoltage.content_path}*id" => "pages#show",
      :as => :page,
      :format => false
    }
  end
end

HighVoltage.configure do |config|
  config.home_page = "home"
  config.route_drawer = RouteDrawers
end
