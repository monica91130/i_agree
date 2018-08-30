class TopController < ApplicationController

	def index
		@categories = Category.all.sort_by{|cate| cate.posts.count}.reverse
  	end

end
