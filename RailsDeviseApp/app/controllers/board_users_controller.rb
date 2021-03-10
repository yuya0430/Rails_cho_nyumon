class BoardUsersController < ApplicationController
  before_action :set_board_user, only: %i[ show edit update destroy ]
  before_action :authenticate_account!
  # layout 'board_users' #必要に応じて用意

  # GET /board_users or /board_users.json
  def index
    users = BoardUser.where 'account_id == ?', current_account.id
    if users[0] == nil then
      user = BoardUser.new
      user.account_id = current_account.id
      user.nickname = '<<no name>>'
      user.save
      users = BoardUser.where 'account_id == ?', current_account.id
    end
    @board_user = users[0]
  end

  # GET /board_users/1 or /board_users/1.json
  def show
    @board_user = BoardUser.find params[:id]
  end

  # GET /board_users/new
  def new
    redirect_to '/board_comments'
  end

  # GET /board_users/1/edit
  def edit
    redirect_to '/board_comments'
  end

  # POST /board_users or /board_users.json
  def create
    redirect_to '/board_comments'
  end

  # PATCH/PUT /board_users/1 or /board_users/1.json
  def update
    respond_to do |format|
      if @board_user.update(board_user_params)
        format.html { redirect_to '/board_comments' }
        format.json { render :show, status: :ok, location: @board_user }
      else
        format.html { render :index }
        format.json { render json: @board_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_users/1 or /board_users/1.json
  def destroy
    redirect_to '/board_comments'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_user
      @board_user = BoardUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_user_params
      params.require(:board_user).permit(:nickname, :account_id, :memo)
    end
end
