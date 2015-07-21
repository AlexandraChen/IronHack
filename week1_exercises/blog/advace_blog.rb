require 'date'
class Blog

	POST_LIMIT = 3 #constant values

	def initialize
		@posts = []
	end

	def add_post(post)
		@posts << post
	end

	def sort_posts
		@posts = @posts.sort_by { |x| x.date}

	end

	def publish_front_page

		sort_posts

		pages = (@posts.length / POST_LIMIT.to_f).ceil

		@posts.each do |i|
			if i.sponsored 
				puts "****** #{i.title} ******"
			else
				puts i.title 
			end
			puts "*" * 30
			puts i.text
			puts "-" * 30
		end


	end

end

class Post 
	attr_accessor :title, :date, :text, :sponsored

	def initialize(title, date, text, sponsored = nil)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end

end

post1 = Post.new "Winter is coming", Date.new(2015,06,16), "bla bla bla", true
post2 = Post.new "New city", Date.new(2015,06,02), "BCN bla bla"
post3 = Post.new "New career", Date.new(2015,06,14), "IronHack bla bla"
post4 = Post.new "Winter is coming", Date.new(2015,06,16), "bla bla bla", true
post5 = Post.new "New city", Date.new(2015,06,02), "BCN bla bla"
post6 = Post.new "New career", Date.new(2015,06,15), "IronHack bla bla"
post7 = Post.new "New career", Date.new(2015,06,15), "IronHack bla bla"

blog = Blog.new
blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)
blog.add_post(post5)
blog.add_post(post6)
blog.add_post(post7)

blog.publish_front_page



