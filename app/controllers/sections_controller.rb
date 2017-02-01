class SectionsController < ApplicationController
	include ApplicationHelper
	def new
		@article = Article.find(params[:article_id])
		@section = Section.new
	end

	def edit
		if current_user
			@section = Section.find(params[:id])
		else
			redirect_to root_path
		end
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


	def show
	end

	def update


			pp params

 		# @article = Article.find(params[:article_id])

 		#params[:id] from route
		@section = Section.find(params[:id])
		@article = @section.article

		if @section.update(section_params)


    	 @section.revisions << Revision.new(user_id: current_user.id, section_id: @section.id)

    	redirect_to article_path(@article)


  	else
    	render 'edit'
  	end



#who did this and why
		# @section = Section(params[:id])
		# @revision = Revision.new(user_id: session[:user_id], section_id: params[:id], body: )

		# if @revision.save
		# 	@section.update_attribute(body: @reivison.body)
		# else
		# end

	end

	private
  def section_params
    params.require(:section).permit(:title, :body)
  end
end
