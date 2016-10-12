require "mechanize"
require "nokogiri"

agent = Mechanize.new

page = agent.get "http://www.osu.edu"

page = agent.page.link_with(:text => 'Academic Calendar').click

body = Nokogiri::HTML(page.body)

#iterates over all texts that are in or a descendant of element td and outputs the ones that contain "no classes"
body.xpath('//td//text()').each do |node|
	puts node if node.to_s.include? "no classes"
end
