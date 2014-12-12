module ApplicationHelper
  def widget(*args, &block)
    options = args.extract_options!
    title = options[:title]||args[0]||nil

    content_tag :div, :class => "tile" do
      concat(content_tag(:h2,title,:class => "tile-title")) if title != nil
      concat(capture(&block))
    end
  end
end