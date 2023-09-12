class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def toggle
    if @likeable.liked_by?(current_user)
      @likeable.unliked_by(current_user)
    else
      @likeable.liked_by(current_user)
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def set_likeable
      @likeable = params[:likeable_type].constantize.find(params[:likeable_id])
    end
end
