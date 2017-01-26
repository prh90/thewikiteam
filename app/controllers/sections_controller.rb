class SectionsController < ApplicationController
	def new
		@article = Article.find(params[:article_id])
		@section = Section.new
	end

	def create
		@article = Article.find(params[:article_id])
		@section = @article.sections.new(section_params)

		if @section.save
			redirect_to article_path(@article)
		else
			render "new"
		end
	end

	def edit
		@section = Section(params[:id])

	end

	def show
	end

	def update
		@section = Section(params[:id])
		@revision = Revision.new(user_id: session[:user_id], section_id: params[:id], body: )

		if @revision.save
			@section.update_attribute(body: @reivison.body)
		else
		end
	end

	private
  def section_params
    params.require(:section).permit(:title, :body)
  end
end
