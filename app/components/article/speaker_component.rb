class Article::SpeakerComponent < ApplicationComponent
  option :name
  option :github

  erb_template <<~ERB
    <div class="mb-5">
      <div class="row g-0">
        <div class="col-auto">
          <div class="card-body">
            <div class="avatar avatar-xl" style="background-image: url(<%= github_avatar_url %>)"></div>
          </div>
        </div>
        <div class="col">
          <div class="card-body ps-0">
            <div class="row">
              <div class="col-md">
                <p class="mb-0">Вещает</p>
                <h3 class="mb-0">Юра Кириллов</h3>
                <div class="mt-2 lh-base">
                  <%= render IconComponent.new(:brand_github) %>
                  <%= link_to "GitHub", github_profile_url, target: "_blank" %>
                </div>
              </div>
              <div class="col-md-auto">
                <div class="mt-3">
                  <%= content %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  ERB

  private

  def github_profile_url
    "https://github.com/#{github}"
  end

  def github_avatar_url
    "https://github.com/#{github}.png"
  end
end
