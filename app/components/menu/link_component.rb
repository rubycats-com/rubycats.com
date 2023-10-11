class Menu::LinkComponent < ApplicationComponent
  param :title
  param :path
  option :new, default: -> { false }
  option :wip, default: -> { false }

  erb_template <<~ERB
    <li>
      <%= link_to path do %>
        <%= render IconComponent.new(:link) %>
        <%= title %>
        <% if new %>
          <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
        <% end %>
        <% if wip %>
          <span class="badge badge-sm bg-red-lt text-uppercase ms-auto">Wip</span>
        <% end %>
      <% end %>
    </li>
  ERB
end
