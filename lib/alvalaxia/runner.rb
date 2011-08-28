require 'cmdparse'
require 'fileutils'
require 'yaml'

module Alvalaxia
  
  class Runner

    CONFIG_FILE = File.expand_path('~/.alvalaxiarc')

    def initialize
      @cmd = CmdParse::CommandParser.new(true, true)
      @cmd.program_name = 'alvalaxia'
      @cmd.program_version = VERSION

      generate_commands
    end

    # start the cli args parsing
    def start
      @cmd.parse
    end

    # create all the cli options
    def generate_commands

      # creating the setup command
      setup = CmdParse::Command.new('setup', false)
      setup.short_desc = 'Creates the config file needed to place the events in a google calendar.'
      setup.description = 'This command creates the ~/.alvalaxiarc file with empty credentials. '
      setup.description << 'User needs to fill in the google calendar credentials.'

      setup.set_execution_block do
        if has_config_file?
          puts 'The config file already exists. If you need to change it, edit it ( ~/.alvalaxiarc )'
        else
          create_config_file
          puts 'Config file created at ~/.alvalaxiarc, edit it with your credentials.'
        end
      end

      # creating the run command
      run = CmdParse::Command.new('run', false)
      run.short_desc = 'Runs the program.'
      run.description = 'Gets the SCP home games and places them as events on a given google calendar.'
      
      run.set_execution_block do
        if has_config_file?
          main
        else
          puts 'You first need to run the "setup" option to generate a config file.'
        end
      end

      @cmd.add_command(setup)
      @cmd.add_command(run)
      @cmd.add_command(CmdParse::HelpCommand.new, true)
      @cmd.add_command(CmdParse::VersionCommand.new, false)
    end

    private

    def main
      puts 'Fetching SCP games calendar...'
      games = Alvalaxia::Scrapper.new.fetch

      # this should not be here... but its late, and I'm lazy :P
      puts 'Saving games in Google Calendar...'
      begin
        cal = Alvalaxia::Calendar.new
        cal.delete_all_events

        games.each do |game|
          # if game is during the week...
          unless ['Sunday', 'Saturday'].include?(game.date.strftime("%A"))
            cal.create_event(game.date)
          end
        end
        puts 'Done!'
      rescue
        puts 'Error: config file not found or with incorrect data.'
      end
    end

    def has_config_file?
      File.exist?(CONFIG_FILE)
    end
    
    # creates the config file with dummy info to be edited
    def create_config_file
      FileUtils.touch(CONFIG_FILE)
      content = { 'credentials' => { 'email' => 'YOUR_GOOGLE_CALENDAR_EMAIL_HERE', 'password' => 'YOUR_PASSWORD_HERE' } }
      File.open(CONFIG_FILE, 'w') { |f| f.write(content.to_yaml) }
    end

  end

end
