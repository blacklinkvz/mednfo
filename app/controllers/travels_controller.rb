class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_travel, only: %i[ show edit update destroy ]



  # GET /travels or /travels.json
  def index
    @travels = Travel.where(user_id: current_user.id)
  end

  # GET /travels/1 or /travels/1.json
  def show
    #Evitamos que se puedan ver viajes de otros usuarios deiferentes al current_user
    @destinies = @travel.destinies
    @travel = Travel.find(params[:id])
      if @travel.user_id != current_user.id
        redirect_to root_path, notice: "No tienes acceso a este viaje"
      end
  end

  # GET /travels/new
  def new
    @travel = Travel.new
  end

  # GET /travels/1/edit
  def edit
  end

  # POST /travels or /travels.json
  def create
    @travel = Travel.new(travel_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @travel.save

        format.html { redirect_to travel_url(@travel), notice: "Travel was successfully created." }
        format.json { render :show, status: :created, location: @travel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travels/1 or /travels/1.json
  def update
    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to travel_url(@travel), notice: "Travel was successfully updated." }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1 or /travels/1.json
  def destroy
    @travel.destroy!

    respond_to do |format|
      format.html { redirect_to travels_url, notice: "Travel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel
      @travel = Travel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def travel_params
      params.require(:travel).permit(:name, :start_date, :finish_date, :user_id)
    end

    def authenticate_user!
      redirect_to new_user_session_path, alert: "Tienes que registrarte o ingresar para continuar" unless user_signed_in?
    end
end
