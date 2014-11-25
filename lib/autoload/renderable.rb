module Renderable
  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

  def render(field)
    renderer.render(self.send(field))
  end
end
