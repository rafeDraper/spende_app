class MeetingsItemsController < ApplicationController
  before_action :set_meeting_list
  before_action :set_meetings_item, except: %i[create]
  def create
    @meetings_item = @meetings_list.meetings_items.create(meeting_item_params)

    redirect_to @meetings_list
  end

  def new
    @meetings_item = MeetingsItem.new
  end

  def destroy
    if @meetings_item.destroy
      flash[:success] = 'meetings list item was deleted.'
    else
      flash[:error] = 'meetings list item could not be deleted.'
    end
    redirect_to @meetings_list
  end

  def complete
    @meetings_item.update_attribute(:completed_at, Time.now)
    redirect_to @meetings_list, notice: 'Meetings item completed'
  end

  private

  def set_meeting_list
    @meetings_list = MeetingsList.find(params[:meetings_list_id])
  end

  def set_meetings_item
    @meetings_item = @meetings_list.meetings_items.find_by(id: params[:id])
  end

  def meeting_item_params
    params[:meetings_item].permit(:date, :amount_cents, :con_change,
                                  :amount_currency, :reason)
  end
end
