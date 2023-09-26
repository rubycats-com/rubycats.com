class Menu::LinkComponent < ApplicationComponent
  param :title
  param :path
  option :new, default: -> { false }

  erb_template <<~ERB
    <li>
      <%= link_to path do %>
        <%= render IconComponent.new(:link) %>
        <%= title %>
        <% if new %>
          <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
        <% end %>
      <% end %>
    </li>
  ERB
end
