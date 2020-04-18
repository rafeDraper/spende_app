# frozen_string_literal: true

class MeetingsListsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_meetings_list, only: %i[show edit update destroy]
  
  # GET /meetings_lists
  # GET /meetings_lists.json
  def index
    @meetings_lists = MeetingsList.all
  end

  # GET /meetings_lists/1
  # GET /meetings_lists/1.json
  def show
    @show_total = Money.new @meetings_list.meetings_items.sum(:amount_cents)
  end

  # GET /meetings_lists/new
  def new
    @meetings_list = MeetingsList.new
    authorize @meetings_list
  end

  # GET /meetings_lists/1/edit
  def edit; end

  # POST /meetings_lists
  # POST /meetings_lists.json
  def create
    @meetings_list = MeetingsList.new(meetings_list_params)

    respond_to do |format|
      if @meetings_list.save
        format.html { redirect_to @meetings_list, notice: 'Meetings list was successfully created.' }
        format.json { render :show, status: :created, location: @meetings_list }
      else
        format.html { render :new }
        format.json { render json: @meetings_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings_lists/1
  # PATCH/PUT /meetings_lists/1.json
  def update
    respond_to do |format|
      if @meetings_list.update(meetings_list_params)
        format.html do
          redirect_to @meetings_list,
                      notice: 'Meetings list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @meetings_list }
      else
        format.html { render :edit }
        format.json { render json: @meetings_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings_lists/1
  # DELETE /meetings_lists/1.json
  def destroy
    @meetings_list.destroy
    respond_to do |format|
      format.html do
        redirect_to root_url,
                    notice: 'Meetings list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meetings_list
    @meetings_list = MeetingsList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meetings_list_params
    params.require(:meetings_list).permit(:title, :responsible)
  end
end
