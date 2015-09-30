class NokoWrapper 
  require 'open-uri'
  def initialize(url)
    @html = Nokogiri::HTML(open("#{url}"))
  end

  def css(css_selector)
    result = []
    @html.css("#{css_selector}").each do |node|
      result << node.text
    end
    result
  end
end