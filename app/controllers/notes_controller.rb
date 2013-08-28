class NotesController < ApplicationController
  #The get_episode method is defined below.
  #It takes the episode_id from routing and
  #turns it into an @episode object.
  before_filter :get_episode
  before_filter :get_program

  # GET /notes
  # GET /notes.json
  def index
    @notes = @episode.notes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
	@note = @episode.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    #@note = Note.new
	@episode = Episode.find(params[:episode_id])
	@note = @episode.notes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
	@note = @episode.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
	@note = @episode.notes.build(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to program_episode_notes_url(@program, @episode), notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
	@note = @episode.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to program_episode_notes_url(@program, @episode), notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = @episode.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to (program_episode_notes_path(@program, @episode)) }
      format.json { head :no_content }
    end	
  end
  
  private
  def get_episode
    @episode = Episode.find(params[:episode_id])
  end
  
  def get_program
    @program = Program.find(params[:program_id])
  end
end
