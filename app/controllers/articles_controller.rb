class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
    @attachment = Attachment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    # Tagging.destroy_by(article_id: params[:id])
    # Comment.destroy_by(article_id: params[:id])
    Article.destroy(params[:id])
    flash.notice = 'Article Destroyed!'
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end
end
