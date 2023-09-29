class Page::LikeComponent < ApplicationComponent
  LIKES_LIMIT = 5

  option :page
  option :user

  option :likes, default: -> { page.likes }
  option :user_like, default: -> { likes.find_by(user: user) }
  option :others_likes, default: -> { likes.where.not(user: user).limit(LIKES_LIMIT) }

  erb_template <<~ERB
    <span class="avatar-list avatar-list-stacked me-3" style="display: inline-block">
      <% if user_like.present? %>
        <span class="avatar avatar-xs rounded" style="background-image: url(<%= github_avatar_url(user_like.user.uid) %>)"></span>
      <% end %>
      <% others_likes.each do |other_user_like| %>
        <span class="avatar avatar-xs rounded" style="background-image: url(<%= github_avatar_url(other_user_like.user.uid) %>)"></span>
      <% end %>
    </span>
    <button class="switch-icon-a text-muted btn">
      <%= render IconComponent.new(:heart) %>
      <span><%= page.likes.count %></span>
    </button>
  ERB

  private

  def github_avatar_url(github)
    "https://github.com/#{github}.png"
  end
end
