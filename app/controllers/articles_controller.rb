class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    related_categories = article_params[:category_ids].reject(&:empty?)
    # article = {title: article_params[:title], summary: article_params[:summary]}
    # categories = article_params[:category_ids]
    p "&&&&" * 25
    p article_params
    # p categories
    # creator_id: current_user.id, Needed to complete submission
    @article = Article.new(creator_id: session[:user_id], title: article_params[:title], summary: article_params[:summary], footer: article_params[:footer])
    if @article.save
      Category.find(related_categories).each {|category| category.articles << @article}
      redirect_to article_path(@article)
    else
      render new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @sections = @article.sections.order(id: :asc)
    p @sections 
   # p "sections"
   # p @article.sections
    #trying to order by id 
   # p  @sections.order(id: :asc)
  end


  private

  def article_params
    params.require(:article).permit(:title, :summary, :footer, :category_ids => [])
  end
end
