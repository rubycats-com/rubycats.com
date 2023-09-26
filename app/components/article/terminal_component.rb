class Article::TerminalComponent < ApplicationComponent
  option :title, default: -> { "Terminal" }

  erb_template <<~ERB
    <div class="card mb-4">
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
        <pre class="pb-0" style="border-radius: 0px 0px 3px 3px; border: 2px solid #e4e5e6"><%= terminal_content %></pre>
      </div>
    </div>
  ERB

  def terminal_content
    content.gsub(/\n( +)/, "<br>").sub("<br>", "").sub("\n", "").html_safe
  end
end
