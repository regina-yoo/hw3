class EntriesController < ApplicationController
  before_action :set_place

  def new
    @entry = @place.entries.new
  end

  def create
    @entry = @place.entries.new(entry_params)
    if @entry.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :posted_on)
  end
end
