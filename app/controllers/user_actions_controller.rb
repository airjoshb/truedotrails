class UserActionsController < ApplicationController
  before_action :set_user_action, only: [:show, :edit, :update, :destroy]

  # GET /user_actions
  def index
    @user_actions = UserAction.all
  end

  # GET /user_actions/1
  def show
  end

  # GET /user_actions/new
  def new
    @user_action = UserAction.new
  end

  # GET /user_actions/1/edit
  def edit
  end

  # POST /user_actions
  def create
    @user_action = current_user.user_actions.build(user_action_params)
    if @user_action.save
      redirect_to dashboard_path, notice: 'Proof submitted and awaiting approval!'
      flash[:notice] = 'Proof submitted and awaiting approval!'
    else
      render :new
    end
  end

  # PATCH/PUT /user_actions/1
  def update
    if @user_action.update(user_action_params)
      redirect_to @user_action, notice: 'User action was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_actions/1
  def destroy
    @user_action.destroy
    redirect_to user_actions_url, notice: 'User action was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_action
      @user_action = UserAction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_action_params
      params.require(:user_action).permit(:attachment, :note, :proof, :challenge_step_id)
    end
end
