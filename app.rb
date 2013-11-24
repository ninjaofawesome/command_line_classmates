require './lib/*'	

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

names = student_scraper.get_names

twitters = student_scraper.get_twitters

blogs = student_scraper.get_blogs


students= []
28.times do |i|
	students << Student.new(names[i], twitters[i], blogs[i])
end

Tonight try to write a scraper that retrieve a name of one pokemon from bulbepedia.
Challenge, have them scrape them all.

Write an anonymous pokemon class with 1 instance method called name and one regular method called name





# 1. make a new scraper (gets information from website)
# my_scraper = Scraper.new("website address")

# 2. get the student names from the scraper
# names = my_scraper.get_student_names

# 3. get the blogs
# 4. get the twitter
# 5. make a new student object for each person


# the app will interface with the scraper

# The student class will look like:
# 3 parameters in the intialize method

# Problems that can occur to consider:
# what if they don't have a blog or a twitter?
# when to use the next option?
# how to track the relationship between the data?

# The app is where the "student" is created- it will combine the scraper and student information.  Your app will have 28 objects
