class HashtagsController < ApplicationController

  def index
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:search_hash])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end

  
end
