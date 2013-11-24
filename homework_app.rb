# require './lib/*.rb'
Dir["./lib/*.rb"].each {|file| require file }
require 'launchy'
require 'open-uri'
require 'nokogiri'

class Rando_student


	TWITTER = [
		'http://twitter.com/aminethedream',
		'http://twitter.com/arielisaacs',
		'http://twitter.com/mando_amador',
		'http://twitter.com/dereksilverman',
		'http://twitter.com/LololiZayn',
		'http://twitter.com/LewisJPaul',
		'http://twitter.com/kt_hffmn',
		'http://twitter.com/Kphillycat',
		'http://twitter.com/keturahwalters',
		'http://twitter.com/nishacodes',
		'http://twitter.com/oliverswitzer',
		'http://twitter.com/opheliadaisies',
		'http://twitter.com/sranso',
		'http://twitter.com/kittykaraoke',
		'http://twitter.com/poojawins',
		'http://twitter.com/JONBRWN_',
		'http://twitter.com/nordgrenator',
		'http://twitter.com/superxtanza',
		'http://twitter.com/feliciaogarro'
	]

	attr_reader :name, :twitter, :blog, :scraper

	def initialize(url)
		@scraper = Scraper.new(url)
		@name = @scraper.get_student_names
		@twitter = @scraper.get_twitter_names
		@blog = @scraper.get_blog_names

	end


	def rando_blog
		rand_blog = blog.sample
		Launchy.open("#{rand_blog}")
	end

	def rando_twitter_open
		Launchy::open(TWITTER.sample)
	end




end
student = Rando_student.new("http://flatironschool-bk.herokuapp.com/")
puts student.rando_twitter_open
puts student.rando_blog
