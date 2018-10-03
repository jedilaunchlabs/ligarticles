class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def dashboard
    @articles = Article.all.order("created_at DESC")
  end

end
