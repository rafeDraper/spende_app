# frozen_string_literal: true

class MeetingsItemsController < ApplicationController
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
    flash[:notice] = if @meetings_item.destroy
                       'Listenelement gelöscht.'
                     else
                       'Listenelement kann nicht gelöscht werden.'
                     end
    redirect_to @meetings_list
  end

  def complete
    @meetings_item.update_attribute(:completed_at, Time.now)
    redirect_to @meetings_list, notice: 'Aufgabe erledigt'
  end

  private

  def set_meeting_list
    @meetings_list = MeetingsList.find(params[:meetings_list_id])
  end

  def set_meetings_item
    @meetings_item = @meetings_list.meetings_items.find_by(id: params[:id])
  end

  def meeting_item_params
    params[:meetings_item].permit(:date, :reason, :amount)
  end
end
