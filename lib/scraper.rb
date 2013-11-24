
#require the libraries that we need
require 'open-uri' #it opens the URI aka URL
require 'nokogiri' #

#start by establishing a class and an intialize method with a url parameters.
class Scraper

	attr_reader :html

	def initialize(url)
		download = open(url) #you don't need this outside of initialize, so it can be local.
		@html = Nokogiri::HTML(download)
	
	end

	def get_student_names
		students = html.search("div.face.front h3").to_s().split("</h3>").each {|item| item.slice!(0..3)} 
	end

	def get_twitter_names
		t_names = Array.new
		all_the_twitters = html.search(".social")
		all_the_twitters.text.split(" ").each { |i| t_names << i if i.start_with?("@")}
		t_names
	end

	# def get_twitter_names
	# 	t_names = Array.new
	# 	all_the_twitters = html.search(".social")
	# 	all_the_twitters.text("Blog").split(" ").each { |i| t_names << i if i.start_with?("@")}
	# 	t_names
	# end

	def get_blog_names
		array = html.search("ul.social")
		array.map {|ul| blog = ul.search("a.blog"); blog[0] ? blog[0]["href"] : nil }
	end


	end

	# def get_blog_names
	# 	blog_url = Array.new
	# 	all_the_blogs = html.search("a.blog")
	# 	blog_url = all_the_blogs.to_s().split(" ").select {|item| blog_url << item if item.include?("href")} 
	# 	blog_url.each {|x| x.slice!(0..4)}
	# end




# my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
# puts my_scraper.get_twitter_names
