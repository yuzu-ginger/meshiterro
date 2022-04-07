class PostImagesController < ApplicationController
  def new
     @post_image = PostImage.new
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    
    # @post_image(投稿データ)のuser_idをcurrent_user.id(今ログインしているID)に指定することで,
    #投稿データに今ログイン中のIDを持たせる
    @post_image.user_id = current_user.id
    
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end

  def edit
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
