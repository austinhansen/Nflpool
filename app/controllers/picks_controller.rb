class PicksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin!, except: [:index, :new, :edit, :create, :update]
  before_action :authorize_edit, only: [:edit, :update]


  # GET /picks
  # GET /picks.json
  def index
    if current_user.admin?
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    @picks = @user.picks.order("#{:created_at} DESC").page(params[:page]).per(20)
  end

  # GET /picks/1
  # GET /picks/1.json
  def show
    @pick = @game.picks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/new
  # GET /picks/new.json
  def new
    @game = Game.find params[:game_id]
    @pick = @game.picks.find_or_initialize_by(user_id: current_user.id)
  end

  # GET /picks/1/edit
  def edit
    @game = @pick.game
  end

  # POST /picks
  # POST /picks.json
  def create
    @game = Game.find params[:game_id]
    @pick = @game.picks.build(picks_params)
    @pick.user = current_user
    @pick.save

    respond_to do |format|
      if @pick.save
        format.html { redirect_to games_path, notice: 'Pick was successfully created.' }
        format.json { render json: @pick, status: :created, location: @pick }
      else
        format.html { render action: "new", id: @pick.id }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /picks/1
  # PUT /picks/1.json
  def update
    respond_to do |format|
      if @pick.update_attributes(picks_params)
        format.html { redirect_to games_path, notice: 'Pick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy

    respond_to do |format|
      format.html { redirect_to picks_url }
      format.json { head :no_content }
    end
  end

  private

    def picks_params
      params.require(:pick).permit(:game_id, :pick_team_id, :user_id, :date, :wager) if params[:pick]
    end

    def authorize_edit
      pick_var = Pick.find params[:id]
      if current_user.admin? || pick_var.user_id == current_user.id
          @pick = pick_var
      else
        render nothing: true, status: :forbidden
    end
  end
end
