class EpisodesController < ApplicationController
  
  before_filter :get_program

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = @program.episodes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episodes }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = @program.episodes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/new
  # GET /episodes/new.json
  def new
    @program = Program.find(params[:program_id])
	@episode = @program.episodes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
    @episode = @program.episodes.find(params[:id])
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = @program.episodes.build(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html { redirect_to program_episodes_url(@program), notice: 'Episode was successfully created.' }
        format.json { render json: @episode, status: :created, location: @episode }
      else
        format.html { render action: "new" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update
    @episode = @program.episodes.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to program_episodes_url(@program), notice: 'Episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = @program.episodes.find(params[:id])
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to (program_episodes_path(@program)) }
      format.json { head :no_content }
    end
  end

  private
  
  def get_program
    @program = Program.find(params[:program_id])
  end
  end
