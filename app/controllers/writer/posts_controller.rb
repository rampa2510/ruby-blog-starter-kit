class Writer::PostsController < WriterController
  before_action :set_post, only: %i[show edit update destroy submit]

  def index
    @posts = current_user.posts
  end

  def show; end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to writer_posts_path, notice: 'Post was successfully saved as draft'
    else
      puts @post.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      notice = @post.draft? ? 'Draft was successfully updated' : 'Post was updated successfully'
      redirect_to writer_posts_path, notice:
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
  end

  def submit
    if @post.submit!
      redirect_to writer_posts_path, notice: 'Post was successfully submitted for review'
    else
      redirect_to writer_post_path(@post), alert: 'Failed to submit the post for review'
    end
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :sub_text, tag_ids: [])
  end
end
