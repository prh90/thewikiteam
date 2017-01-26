class WelcomeController < ApplicationController

	def index
		if params[:search]
			@articles = Article.where('title LIKE ?', "%#{params[:search]}%")
		else
			@articles = Article.all
		end
	end

end
