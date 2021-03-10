class BoardCommentsController < ApplicationController
  before_action :set_board_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_account!
  layout 'board_comments'

  # GET /board_comments or /board_comments.json
  def index
    @board_comments = BoardComment.page(params[:page]).order('created_at desc')
    users = BoardUser.where('account_id == ?', current_account.id)[0]
    if users == nil then
      user = BoardUser.new
      user.account_id = current_account.id
      user.nickname = '<<no name>>'
      user.save
      users = BoardUser.where 'account_id == ?', current_account.id
    end
    @board_user = users
    @board_comment = BoardComment.new
    @board_comment.board_user_id = @board_user.id
  end

  # GET /board_comments/1 or /board_comments/1.json
  def show
    redirect_to '/board_comments'
  end

  # GET /board_comments/new
  def new
    redirect_to '/board_comments'
  end

  # GET /board_comments/1/edit
  def edit
    redirect_to '/board_comments'
  end

  # POST /board_comments or /board_comments.json
  def create
    @board_comment = BoardComment.page(params[:page]).order('created_at desc')
    @board_comment = BoardComment.new(board_comment_params)
    @board_user = BoardUser.where('account_id == ?', current_account.id)[0]

    respond_to do |format|
      if @board_comment.save
        format.html { redirect_to '/board_comments' }
        format.json { render :show, status: :created, location: @board_comment }
      else
        format.html { render :index }
        format.json { render json: @board_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_comments/1 or /board_comments/1.json
  def update
    redirect_to '/board_comments'
  end

  # DELETE /board_comments/1 or /board_comments/1.json
  def destroy
    redirect_to '/board_comments'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_comment
      @board_comment = BoardComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_comment_params
      params.require(:board_comment).permit(:content, :board_user_id)
    end
end