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
    @article = Article.new(title: article_params[:title], summary: article_params[:summary])
    if @article.save
      Category.find(related_categories).each {|category| category.articles << @article}
      redirect_to article_path(@article)
    else
      render new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @sections = @article.sections
  end


  private

  def article_params
    params.require(:article).permit(:title, :summary, :category_ids => [])
  end
end
