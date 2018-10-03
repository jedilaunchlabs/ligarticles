class AdminsController < ApplicationController

  def dashboard
    @articles = Article.all
  end
  
end
