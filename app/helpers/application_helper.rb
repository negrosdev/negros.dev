module ApplicationHelper
  def markdown(text)
    options = %i[hard_wrap autolink no_intra_emphasis fenced_code_blocks]
    Markdown.new(text, *options).to_html
  end
end
