class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]

  # GET /posts
  def index
    posts = Post.all
    render json: posts
  end

  # POST /posts
  def create
    post = Post.new(post_params)
    if post.save
      render json: { status: 200, message: "Post created successfully" }, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      render json: { status: 200, message: "Post updated successfully" }, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    if @post.destroy
      render json: { status: 200, message: "Post deleted successfully" }, status: :ok
    else
      render json: { status: 422, error: "Failed to delete the post" }, status: :unprocessable_entity
    end
  end

  private

  # Find the post by ID
  def set_post
    @post = Post.find(params[:id])
  end

  # Strong parameters
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

# class PostsController < ApplicationController
#   before_action :set_post, only: %i[ show update destroy ]

#   # GET /posts
#   def index
#     @posts = Post.all

#     render json: @posts
#   end

#   # GET /posts/1
#   def show
#     render json: @post
#   end

#   # POST /posts
#   def create
#     @post = Post.new(post_params)

#     if @post.save
#       render json: @post, status: :created, location: @post
#     else
#       render json: @post.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /posts/1
#   def update
#     if @post.update(post_params)
#       render json: @post
#     else
#       render json: @post.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /posts/1
#   def destroy
#     @post.destroy!
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_post
#       @post = Post.find(params.expect(:id))
#     end

#     # Only allow a list of trusted parameters through.
#     def post_params
#       params.expect(post: [ :title, :body ])
#     end
# end
