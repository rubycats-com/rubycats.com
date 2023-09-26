class Menu::BlockComponent < ApplicationComponent
  param :title

  erb_template <<~ERB
    <h4><%= title %></h4>
    <ul class="list-unstyled space-y-1">
      <%= content %>
    </ul>
  ERB
end
