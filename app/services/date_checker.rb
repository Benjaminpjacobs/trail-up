require 'date'

class DateChecker

  def initialize
    @todays_date = DateTime.now
    @recent_log = ArchiveLog.order(:created_at).last.created_at.day
  end

  def check?
    if substractor(@todays_date.day, @recent_log) == true
      archive_bot
    end
  end

  def substractor(now, past)
    return true if (now - past) > 1
    return true if (now - past) < -1
  end

  def archive_bot
    events = Event.where(archived: false)
    events.each do |event|
      if substractor(@todays_date.day, event.date.day) == true
        event.update_attributes(archived: true)
        event.save
      end
    end
    ArchiveLog.create!
  end

end
