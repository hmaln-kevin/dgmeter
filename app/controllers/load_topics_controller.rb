class LoadTopicsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_load_topic, only: [:show, :edit, :update, :destroy]

  # GET /load_topics
  # GET /load_topics.json
  def index
    @load_topics = LoadTopic.all
  end

  # GET /load_topics/1
  # GET /load_topics/1.json
  def show
  end

  # GET /load_topics/new
  def new
    @load_topic = LoadTopic.new
  end

  # GET /load_topics/1/edit
  def edit
  end

  # POST /load_topics
  # POST /load_topics.json
  def create
    @load_topic = LoadTopic.new(load_topic_params)

    respond_to do |format|
      if @load_topic.save
        format.html { redirect_to @load_topic, notice: 'Load topic was successfully created.' }
        format.json { render :show, status: :created, location: @load_topic }
      else
        format.html { render :new }
        format.json { render json: @load_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /load_topics/1
  # PATCH/PUT /load_topics/1.json
  def update
    respond_to do |format|
      if @load_topic.update(load_topic_params)
        format.html { redirect_to @load_topic, notice: 'Load topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_topic }
      else
        format.html { render :edit }
        format.json { render json: @load_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_topics/1
  # DELETE /load_topics/1.json
  def destroy
    @load_topic.destroy
    respond_to do |format|
      format.html { redirect_to load_topics_url, notice: 'Load topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load_topic
      @load_topic = LoadTopic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def load_topic_params
      params.require(:load_topic).permit(:description, :pin)
    end
end
