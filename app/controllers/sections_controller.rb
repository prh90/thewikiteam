class SectionsController < ApplicationController
	def new
		@section = Section.new
	end

	def create
		@article = Article.find(params[:article_id])
		@section = Section.new(section_params)

		if @section.save
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def edit
	end

	def show
	end

	def update
	end

	private
  def section_params
    params.require(:section).permit(:title, :body, :article_id)
  end
end
