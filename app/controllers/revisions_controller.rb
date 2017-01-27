class RevisionsController < ApplicationController

	def index
		@article = Article.find(params[:article_id])
		@revisions = @article.revisions.order(updated_at: :desc)
	end

end