module ApplicationHelper
  def post_days
    return unless current_user.countdown

    @today = Time.zone.now
    @targetday = current_user.countdown.event_day
    past_seconds = @targetday - @today
    @past_days = (past_seconds / 1.days).floor
    @past_days + 1
  end
end
