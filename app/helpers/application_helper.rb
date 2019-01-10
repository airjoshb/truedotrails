module ApplicationHelper
  def body_class(body_class)
    if body_class.present?
      "#{body_class}"
    

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
  

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
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

    r

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    enderer = Redcarpet::R

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    ender::HTML.new(options)
    markdown = Redcarpet::Markdown.new(r

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    enderer, extensions)

    markdown.r

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    ender(text).html_safe
  

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
  
  def strip(text)
    require 'redcarpet/r

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    ender_strip'
    markdown = Redcarpet::Markdown.new(Redcarpet::R

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    ender::StripDown)
    markdown.r

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    ender(text).html_safe
  

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end

  def svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
    if options[:style].present?
      svg['style'] = options[:style]
    

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
    if options[:width].present?
      svg['width'] = options[:width]
    

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
    if options[:height].present?
      svg['height'] = options[:height]
    

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
    doc.to_html.html_safe
  

    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end




    def user_avatar(user, size = 100, class_name = "avatar")
      if user.avatar.attached?
        tag.span nil, class: class_name, style: "background-image: url(#{polymorphic_url user.avatar})"
      else
        tag.span "#{user.first_name.first}", class: class_name
      end
    end
    end
