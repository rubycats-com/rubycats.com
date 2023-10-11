class Page::TerminalComponent < ApplicationComponent
  param :text
  option :title, default: -> { "Terminal" }

  erb_template <<~ERB
    <div class="card my-5">
      <div class="card-header1 ps-2" style="background: #e4e5e6">
        <div class="row">
          <div class="col">
            <%= render IconComponent.new(:circle_x) %>
            <%= render IconComponent.new(:circle_minus) %>
            <%= render IconComponent.new(:circle_dot) %>
          </div>
          <div class="col text-center"><%= title %></div>
          <div class="col"></div>
        </div>
      </div>
      <div class="card-body px-0 py-0">
        <pre class="pb-3" style="border-radius: 0px 0px 3px 3px; border: 2px solid #e4e5e6; background: #0a1e24; color: #e4e5e6"><%= terminal_content %></pre>
      </div>
    </div>
  ERB

  def terminal_content
    text.sub("\n", "").sub(/\n( +)$/, "")
  end
end
