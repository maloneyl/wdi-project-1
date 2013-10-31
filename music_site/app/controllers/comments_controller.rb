class CommentsController < ApplicationController

load_and_authorize_resource

# reminder: comments is nested within music! need to pass both params!
#     music_comments GET    /music/:music_id/comments(.:format)          comments#index
#                    POST   /music/:music_id/comments(.:format)          comments#create
#  new_music_comment GET    /music/:music_id/comments/new(.:format)      comments#new
# edit_music_comment GET    /music/:music_id/comments/:id/edit(.:format) comments#edit
#      music_comment GET    /music/:music_id/comments/:id(.:format)      comments#show
#                    PUT    /music/:music_id/comments/:id(.:format)      comments#update
#                    DELETE /music/:music_id/comments/:id(.:format)      comments#destroy

  def index # e.g. /music/1/comments will simply show /music/1
    redirect_to music_path(params[:music_id])
  end

  def create
    music_id = params[:music_id]
    if params[:comment][:content].empty?
      redirect_to music_path(music_id), notice: 'Comment cannot be blank!'
      return
    else
      comment = Comment.new(params[:comment])
      comment.music_id = music_id
      comment.user_id = current_user.id
      comment.save
      redirect_to music_path(music_id), notice: 'Comment posted!'
    end
  end

  def destroy
    @music = Music.find(params[:music_id])
    @comment = @music.comments.find(params[:id])
    @comment.delete
    redirect_to music_path(@music)
  end

end
