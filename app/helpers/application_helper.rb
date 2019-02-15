module ApplicationHelper
  def body_class(body_class)
    if body_class.present?
      "#{body_class}"
    end
  end

  def user_avatar(user, size, class_name)
    if user.avatar.attached?
      tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar}); height: #{size}px; width: #{size}px;"
    else
      tag.span "#{user.first_name.first}", class: class_name
    end
  end

  def markdown(text)
    options = {
      hard_wrap:       false,
      link_attributes: { target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      highlight:          true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
  
  def strip(text)
    require 'redcarpet/render_strip'
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown.render(text).html_safe
  end

  def svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    if options[:style].present?
      svg['style'] = options[:style]
    end
    if options[:width].present?
      svg['width'] = options[:width]
    end
    if options[:height].present?
      svg['height'] = options[:height]
    end
    doc.to_html.html_safe
  end

end
