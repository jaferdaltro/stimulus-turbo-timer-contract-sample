module TimeTrackersHelper
  def duration_display(tt)
    duration = ActiveSupport::Duration.build(tt.duration).parts

    format('%02d:%02d:%02d', (duration[:hours]||0), (duration[:minutes]||0), (duration[:seconds]||0))
  end
end
