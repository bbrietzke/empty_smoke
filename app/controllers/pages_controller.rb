class PagesController < ApplicationController
  def home
    @article = Article.new
    @articles = Article.where(published: true).order(:created_at).limit(10)

    return @article, @articles
  end
end
