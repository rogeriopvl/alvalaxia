require 'base64'
require 'yaml'

module SCPHomey
  
  # Gcal4Ruby wrapper class
  class Calendar

    def initialize
      config = read_config
      @service = GCal4Ruby::Service.new
      @service.authenticate(config['credentials']['email'], config['credentials']['password'])
      @calendar = GCal4Ruby::Calendar.find(@service, {:id => config['credentials']['email']})
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

    private

    # Reads the configuration file containing the google account
    # (spare me the insecure bullshit, you should
    # not be using your own google account/calendar.
    # Just create a new one to use with this gem)
    def read_config
      YAML.load_file(File.expand_path('~/.scphomeyrc'))
    end

  end
end
