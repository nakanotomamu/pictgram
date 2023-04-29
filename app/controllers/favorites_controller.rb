class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  # def posts  
  #   @user = @user.posts
  #   @favarites_count = 0
  #   @user_posts.each do |post|
  #   @favarites_count += post.favarites.count
  #   end
  # end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
    
    
  end
end
