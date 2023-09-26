class Article::BlockquoteComponent < ApplicationComponent
  option :name

  erb_template <<~ERB
    <blockquote class="blockquote">
      <%= content %>
      <footer class="blockquote-footer"><%= name %></footer>
    </blockquote>
  ERB
end
