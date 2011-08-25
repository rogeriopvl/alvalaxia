module SCPHomey

  # Gcal4Ruby wrapper class
  class Calendar

    # I should find a way to hide this.... -_-
    GOOGLE_EMAIL = 'scp.homey@gmail.com'
    GOOGLE_PASSWORD = 'youreallywannaholdme?showmehomey!'

    def initialize
      @service = GCal4Ruby::Service.new
      @service.authenticate(GOOGLE_EMAIL, GOOGLE_PASSWORD)
      @calendar = GCal4Ruby::Calendar.find(@service, {:id => GOOGLE_EMAIL})
    end

    def create_event(start_date)
      event = GCal4Ruby::Event.new(@service)
      event.calendar = @calendar
      event.title = 'SCP Plays Home'
      event.all_day = true
      event.start_time = start_date
      event.end_time = start_date
      event.where = 'Alvalade XXI'
      event.reminder = [{ :minutes => 24*60, :method => 'email' }]
      event.save
    end

    def delete_all_events
      current_events = GCal4Ruby::Event.find(@service, 'SCP Plays Home')
      current_events.each do |ev|
        ev.delete
      end
    end

  end
end
