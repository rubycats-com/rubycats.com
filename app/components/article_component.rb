class ArticleComponent < ApplicationComponent
  erb_template <<~ERB
    <div class="card card-lg mb-3">
      <div class="card-body">
        <div class="markdown">
          <%= content %>
        </div>
      </div>
       <div class="card-footer">
        Если вы хотите дополнить или исправить статью
        <a href="https://github.com/rubycats-com/rubycats/tree/main/app/views/articles" target="_blank">Откройте в нее Pull Request!</a>
      </div>
    </div>
  ERB
end
