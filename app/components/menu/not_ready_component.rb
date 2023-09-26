class Menu::NotReadyComponent < ApplicationComponent
  param :title

  erb_template <<~ERB
    <li>
      <%= render IconComponent.new(:hourglass_low) %>
      <%= title %>
    </li>
  ERB
end
