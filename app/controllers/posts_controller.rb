class PostsController < ApplicationController
  def save
    post_uuid = SecureRandom.uuid

    if params[:content].include?('503')
      head 503
    elsif params[:content].include?('500')
      head 500
    else
      REDIS.set(post_uuid, params[:content])
      render json: {
        success: true,
        id: post_uuid
      }
    end
  end
end
