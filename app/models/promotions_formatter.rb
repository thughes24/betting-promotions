class PromotionsFormatter
  attr_reader :data
  def initialize(options={})
    @name = options[:name]
    @title = options[:title]
    @info = options[:info]
    raw_data
  end

  def pretty_display
    puts "\n"
    puts "---------#{@data.keys[0]}-------------"
    @data.values[0].each_with_index do |array,index|
      puts "\n"
      puts array[0]
      puts array[1]
      puts "\n\n"
    end
  end

  def raw_data
    raw_array = []
    @title.each_with_index do |title, index|
      raw_array << [title]
      raw_array[index] << @info[index]
    end
    @data = {@name => raw_array}
  end


end