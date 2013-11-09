class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :notify_friend, :email_owner]
  before_action :set_params_before_update, only: :update
  before_filter :authenticate_user!, :except => [:index, :show, :notify_friend]
  #before_filter :set_current_user
  after_filter :mail, :only => :create

  def mail
    #Notice no observer is being used for article model
    Notifier.article_added(@article).deliver if (Rails.env.production? || Rails.env.development?)
  end

  def notify_friend
    #@job = Job.find(params[:id])

    @time_too_fast = ''
    time_later    # defined in application controller
    hidden_field  # defined in application controller

    if (params[:name].blank? || params[:email].blank?)
      flash[:alert] = "Missing Information"
      render 'show' and return
    end

    if (@hidden.blank? && @time_too_fast.blank?)
      Notifier.email_friend(@article, params[:name], params[:email]).deliver
      flash[:alert] = "Successfully notified friend"
      redirect_to @article
    else
      #params[:notice] = "Missing $$$$$$$$$$$$$$$$$$$$$ #{@hidden} #{@time_too_fast} $$$$$$$$$$$$ Information"
      render 'show'
    end
  end

  def email_owner
      #@job = Job.find(params[:id])

      @time_too_fast = ''
      time_later    # defined in application controller
      hidden_field  # defined in application controller

      if (params[:name].blank? || params[:email].blank?)
        flash[:alert] = "Missing Information"
        render 'show' and return
      end

      if (@hidden.blank? && @time_too_fast.blank?)
        Notifier.email_owner(@article, params[:name], params[:email], params[:message]).deliver
        flash[:alert] = "Successfully emailed owner"
        redirect_to @article
      else
        #params[:notice] = "Missing $$$$$$$$$$$$$$$$$$$$$ #{@hidden} #{@time_too_fast} $$$$$$$$$$$$ Information"
        render 'show'
      end
    end

  # GET /articles
  # GET /articles.json
  def index
    #@articles = Article.page(params[:page])
    # to tell will_paginate how many items per page we want:
    @articles = Article.order("created_at DESC").paginate(page:params[:page], per_page: 30)
    session[:back_to] = nil  # :back_to defined in application_controller check_if_article method
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    session[:time_now] = Time.now
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
    @article.user = current_user # current_user is set equal to so that in the
                                 # notifier.rb article_added method can use @article.user

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
        #puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{@article.inspect}                             #{@article.user}"
        #puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #{current_user}"
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
