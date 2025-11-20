class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: "Movie added to list."
    else
      # If you render :new you need @movies etc. Simpler: render list show so user stays on list page:
      @movie = @bookmark.movie
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list, notice: "Bookmark removed."
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
