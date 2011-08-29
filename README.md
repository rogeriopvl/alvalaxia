# Alvalaxia

## Info

Alvalaxia is a tool package in a rubygem that you can use to get the next Sporting Club Portugal home games. This is useful for people that park their car in the club's stadium park. The games are saved as events in a given Google Calendar with a notification 24 hours before.

**Important: Don't use your own Google Account for this tool.** You should create a new account just for it.

## Install

You can install this tool using rubygems:

    $ sudo gem install alvalaxia

Or you can build the gem yourself using the Rake tasks:

    $ rake package; rake install

## Usage

To use this tool, first you need to run the setup command to create a config file, and the edit the config file with the credentials of the Google Account you created:

    $ alvalaxia setup

    $ vim ~/.alvalaxiarc

Now you just need to run it:

    $ alvalaxia run

You should place this command in a cronjob so that it updates your calendar daily.

**IMPORTANT**

If all you need is to have access to a calendar with the games you can use the one I created, which is public. So in this case, just subscribe to it:

### [Subscribe .ics format][0]

## Are you a SCP fan?

No.

## License

Check the `LICENSE` file.


[0]: https://www.google.com/calendar/ical/scp.homey%40gmail.com/public/basic.ics
