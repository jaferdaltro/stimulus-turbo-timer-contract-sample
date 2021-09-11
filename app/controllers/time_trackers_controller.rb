class TimeTrackersController < ApplicationController
  before_action :set_time_tracker, only: %i[ show edit update destroy ]

  # GET /time_trackers or /time_trackers.json
  def index
    @time_trackers = TimeTracker.all.reverse
    @time_tracker = TimeTracker.new
  end

  def new; end
    
  # POST /time_trackers or /time_trackers.json
  def create
    @time_tracker = TimeTracker.new({started_at: Time.current, status: "running"}.merge(time_tracker_params))
    if @time_tracker.save
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /time_trackers/1 or /time_trackers/1.json
  def update
    if @time_tracker.update(time_tracker_params)
      format.html redirect_to @time_tracker
    else
      render :edit
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_tracker
      @time_tracker = TimeTracker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_tracker_params
      params.require(:time_tracker).permit(:topic, :rate_per_hour, :started_at, :ended_at, :status)
    end
end
