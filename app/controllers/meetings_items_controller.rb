# frozen_string_literal: true

class MeetingsItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting_list
  before_action :set_meetings_item, except: %i[create]

  def create
    @meetings_item = @meetings_list.meetings_items.create(meeting_item_params)
    if @meetings_item.valid?
      @meetings_item.save
      redirect_to @meetings_list, notice: 'Neuer Eintrag hinzugefügt'
    else
      render :new
    end
  end

  def new
    @meetings_item = MeetingsItem.new
  end

  def destroy
    #puts @meetings_item
    authorize @meetings_item
    # flash[:notice] = ('Item erfolgreich vernichtet.' if @meetings_item.destroy)
    # redirect_to @meetings_list
    @meetings_item.destroy
    respond_to do |format|
      format.html do
        redirect_to @meetings_list, notice: 'Item erfolgreich vernichtet.'
      end
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @meetings_item.update(meeting_item_params)
        format.html do
          redirect_to @meetings_list,
                      notice: 'Item erfolgreich aktualisiert'
        end
        format.json { render :show, status: :ok, location: @meetings_list }
      else
        format.html { render :edit }
        format.json { render json: @meetings_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    @meetings_item.update_attribute(:completed_at, Time.now)
    redirect_to @meetings_list, notice: 'Aufgabe erledigt'
  end

  private

  def set_meeting_list
    #puts params[:meetings_list_id]
    @meetings_list = MeetingsList.find(params[:meetings_list_id])
  end

  def set_meetings_item
    #puts params[:id]
    @meetings_item = @meetings_list.meetings_items.find_by(id: params[:id])
  end

  def meeting_item_params
    params[:meetings_item].permit(:date, :reason, :amount)
  end
end
