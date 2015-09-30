task :get_promotions => :environment do
  $rails_rake_task = true
  @data_objects = []
  @agencys = []
  @title = []
  @info = []
  @processed_data = []
  
  count = 0
  Agent.all.each do |agent|
    @agencys << agent.name
    @data_objects << NokoWrapper.new(agent.url)
  end
  
  @data_objects.each_with_index do |html,index|
    @agent = Agent.find_by(id: index+1)
    @title << html.css(@agent.title_select)
    @info << html.css(@agent.info_select)
  end
  
  @title.each do |title|
    title.reject!(&:empty?)
  end
  
  @info.each do |info|
    info.reject!(&:empty?)
  end
  @agencys.each_with_index do |agent,index|
    name = agent
    title = @title[index]
    info = @info[index]
    @processed_data << PromotionsFormatter.new(name: name, title: title,info: info)
  end
  
  @processed_data.each do |promo_w_agent|
    agent = Agent.find_by(name: promo_w_agent.data.keys[0])
    promo_w_agent.data.values[0].each do |promo|
      Promotion.create(agent: agent, title: promo[0], info: promo[1])
    end
  end
end

task :remove_blank_promotions => :environment do
  Promotion.where(info: nil).delete_all
end

task :clear_promotions => :environment do
  Promotion.delete_all
end

task :getpromos => [:clear_promotions, :get_promotions, :remove_blank_promotions]

#@processed_data.data.each do |agency_promo| ##CONTINUE HERE, SCRAPE WORKS, NOW PUT INTO DATABASE SOMEHOW
#  agent_name = ageny_promo.keys[0]
#  binding.pry
#  data.values.each do |promotion|
#    Promotion.create(agent_id: (Agent.find_by(name: agent_name)),title: promotion[, info: )

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