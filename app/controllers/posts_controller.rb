class PostsController < ApplicationController

    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created, location: @group
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end
end
