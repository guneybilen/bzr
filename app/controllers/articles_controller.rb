class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_params_before_update, only: :update

  # GET /articles
  # GET /articles.json
  def index
    #@articles = Article.page(params[:page])
    # to tell will_paginate how many items per page we want:
    @articles = Article.order("created_at DESC").paginate(page:params[:page], per_page: 30)
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

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :location, :body, :price, :image1,
                                      :image2, :image3, :image4, :image5, :delete_asset1, :delete_asset2,
                                      :delete_asset3, :delete_asset4, :delete_asset5)
    end

    def set_params_before_update
      @article.delete_asset1 = params[:delete_asset1]
      @article.delete_asset2 = params[:delete_asset2]
      @article.delete_asset3 = params[:delete_asset3]
      @article.delete_asset4 = params[:delete_asset4]
      @article.delete_asset5 = params[:delete_asset5]
    end
end
