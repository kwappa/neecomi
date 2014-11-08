class BlogContentsController < ApplicationController
  before_action :set_user
  before_action :set_blog_content, only: [:show, :edit, :update, :destroy]

  # GET /blog_contents
  def index
    @blog_contents = BlogContent.all
  end

  # GET /blog_contents/1
  def show
  end

  # GET /blog_contents/new
  def new
    @blog_content = BlogContent.new
  end

  # GET /blog_contents/1/edit
  def edit
  end

  # POST /blog_contents
  def create
    @blog_content = BlogContent.new(blog_content_params)

    if @blog_content.save
      redirect_to @blog_content, notice: 'Blog content was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blog_contents/1
  def update
    if @blog_content.update(blog_content_params)
      redirect_to @blog_content, notice: 'Blog content was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blog_contents/1
  def destroy
    @blog_content.destroy
    redirect_to blog_contents_url, notice: 'Blog content was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_content
    @blog_content = BlogContent.find(params[:id])
  end

  def set_user
    @user = User.find_by(name: params[:name]) || raise(Neecomi::Err::NotFound)
  end

  # Only allow a trusted parameter "white list" through.
  def blog_content_params
    params.require(:blog_content).permit(
      :user_id,
      :title,
      :body,
      :published_at
    )
  end
end
