class LoadsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  load_and_authorize_resource
  # before_action :test_connection, only: [:update]
  before_action :set_load, only: [:show, :edit, :update, :destroy]

  # GET /loads
  # GET /loads.json
  def index
    @loads = Load.all
    @units = Unit.all
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1
  # PATCH/PUT /loads/1.json
  def update
    respond_to do |format|
      if @load.update(load_params) and @load.device.connection
        format.html { redirect_to loads_url, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { redirect_to loads_url, notice: 'Devise offline cannot change state' }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # Trava na hora de criar uma nova load se o device estiver off
    def load_params
      # if @load.device.connection?
        params.require(:load).permit(:description, :state, :schedule, :load_topic_id, :device_id)
      # else
      #   params.require(:load).permit(:description, :schedule, :load_topic_id, :device_id)
      # end
    end
end
