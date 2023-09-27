class Article::CodeComponent < ApplicationComponent
  param :code

  erb_template <<~ERB
    <div class="language-plaintext highlighter-rouge">
      <div class="highlight">
        <pre class="highlight text-black" style="background: #f6f8fb; border: 1px solid #e4e5e6"><code><%= code_content %></code></pre>
      </div>
    </div>
  ERB

  def code_content
    code.sub("\n", "").sub(/\n( +)$/, "")
  end
end
