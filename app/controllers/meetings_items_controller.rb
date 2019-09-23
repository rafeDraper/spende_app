class MeetingsItemsController < ApplicationController
  before_action :set_meeting_list
  def create
    @meetings_item = @meetings_list.meetings_items.create(meeting_item_params)

    redirect_to @meetings_list
  end

  def destroy
    @meetings_item = @meetings_list.meetings_items.find(params[:id])
    if @meetings_item.destroy
      flash[:success] = 'meetings list item was deleted.'
    else
      flash[:error] = 'meetings list item could not be deleted.'
    end
    redirect_to @meetings_list
  end

  private

  def set_meeting_list
    @meetings_list = MeetingsList.find(params[:meetings_list_id])
  end

  def meeting_item_params
    params[:meetings_item].permit(:date, :amount, :kind, :reason)
  end
end
