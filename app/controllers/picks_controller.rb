class PicksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin!, except: [:index, :new, :edit, :create, :update]

  # GET /picks
  # GET /picks.json
  def index
    @picks = Pick.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @picks }
    end
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/1/edit
  def edit
    @pick = Pick.find(params[:id])
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
    @pick = Pick.find(params[:id])

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
end
