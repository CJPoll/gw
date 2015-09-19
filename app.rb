require 'rubygems'
require 'sinatra'
require 'slackoff'
require 'slackoff/slash'

post '/guild-wars' do
  slash_data = Slackoff::SlashData.new(params)

  text = "@channel: Hey, it's #{slash_data.user_name}. Come play guild wars with me!"
  username = 'Guild Wars 2 Notifications'
  channel = 'guild-wars'

  message = Slackoff::Post.new
  message.text = text
  message.username = username
  message.channel = channel

  slack = Slackoff::Slack.new
  hook = slack.incoming_webhook(ENV['guild_wars_hook'])
  hook.send(message)

  status 200
  body ''
end
