class Page::BackForwardComponent < ApplicationComponent
  option :back_name, default: -> { "Это начало" }
  option :back_url, optional: true
  option :forward_name, default: -> { "Это конец" }
  option :forward_url, optional: true

  erb_template <<~ERB
    <div class="card">
      <div class="card-body">
        <ul class="pagination ">
          <li class="page-item page-prev <%= "disabled" unless back_url.present? %>">
            <a class="page-link" href="<%= back_url %>">
              <div class="page-item-subtitle">Назад</div>
              <div class="page-item-title"><%= back_name %></div>
            </a>
          </li>
          <li class="page-item page-next <%= "disabled" unless forward_url.present? %>">
            <a class="page-link" href="<%= forward_url %>">
              <div class="page-item-subtitle">Далее</div>
              <div class="page-item-title"><%= forward_name %></div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  ERB
end
