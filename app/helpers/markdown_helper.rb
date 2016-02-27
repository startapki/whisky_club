module MarkdownHelper
  OPTIONS = {
    filter_html: true,
    hard_wrap: true,
    link_attributes: { rel: 'nofollow', target: '_blank' },
    space_after_headers: true,
    fenced_code_blocks: true
  }.freeze

  EXTENSIONS = {
    autolink: true,
    superscript: true,
    disable_indented_code_blocks: true
  }.freeze

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, EXTENSIONS)

    markdown.render(text).html_safe
  end

  alias m markdown
end
