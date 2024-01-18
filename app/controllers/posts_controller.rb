class PostsController < ApplicationController
    before_action :set_user, only: %i[ destroy ]

    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        # debugger
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:title, :body, :user_id)
        end
end
