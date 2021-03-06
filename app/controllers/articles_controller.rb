class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :destroy, :update]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.with_attached_image.order("created_at DESC").limit(5)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    # @article.image.attach(params[:article][:image])

    respond_to do |format|
      if @article.save
        format.html { redirect_to dashboard_path, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def archive
    @articles = Article.with_attached_image.order("created_at DESC").page(params[:page])
    
    params[:page] = "1" if params[:page].nil?
    @current_page = params[:page]
    @total_pages = (Article.count + Article::PER_PAGE - 1) / Article::PER_PAGE
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:image, :title, :description)
    end
end
