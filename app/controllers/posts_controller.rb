class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(strong_params)

    if @post.save
      flash[:Successfully] = "Yazı Başarıyla Eklendi."
      redirect_to post_path(@post)
    else
      flash[:error] = "Yazı Eklenemedi."
      render :new
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    if @post.update(strong_params)
      flash[:Successfully] = "Yazı Başarıyla Güncellendi."
      redirect_to post_path(@post)
    else
      flash[:error] = "Yazı Güncellenemedi."
      render :edit
    end
  end
  def destroy
    @post.destroy
    flash[:Successfully] = "Yazı Silindi"
    redirect_to posts_path
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end
  def strong_params
    params.require(:post).permit(:title, :body)
	end

end