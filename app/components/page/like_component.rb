class Page::LikeComponent < ApplicationComponent
  prepend TurboFramable
  LIKES_LIMIT = 5

  option :page
  option :user

  option :likes, default: -> { page.likes }
  option :user_like, default: -> { likes.find_by(user: user) }
  option :others_likes, default: -> { likes.where.not(user: user).limit(LIKES_LIMIT) }

  erb_template <<~ERB
    <span class="avatar-list avatar-list-stacked me-3" style="display: inline-block">
      <% if user_like.present? %>
        <span class="avatar avatar-xs rounded" style="background-image: url(<%= user_like.user.avatar_url %>)"></span>
      <% end %>
          <% others_likes.each do |other_user_like| %>
        <span class="avatar avatar-xs rounded" style="background-image: url(<%= other_user_like.user.avatar_url %>)"></span>
      <% end %>
    </span>
    
    <% if user.present? %>
      <%= button_to page_like_path(@page), class: "switch-icon-a text-muted btn", form: {class: "d-inline-block"}, method: form_method do %>
        <span class="text-danger">
          <%= render IconComponent.new(icon) %>
        </span>
        <span><%= page.likes.count %></span>
      <% end %>
    <% else %>
      <%= button_to omniauth_authorize_path(User, "github"), class: "switch-icon-a text-muted btn", form: {class: "d-inline-block"}, data: {turbo: false} do %>
        <span class="text-danger">
          <%= render IconComponent.new(icon) %>
        </span>
        <span><%= page.likes.count %></span>
      <% end %>
    <% end %>
  ERB

  private

  def turbo_frame_id
    dom_id(page, "likes")
  end

  def form_method
    user_like.present? ? :delete : :post
  end

  def icon
    user_like.present? ? :heart_filled : :heart
  end
end
