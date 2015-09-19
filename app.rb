require 'sinatra'
require 'slackoff'

post '/guild-wars' do
  message = '@channel: Come play guild wars with me!'
  slack = Slackoff::Slack.new
  hook = slack.incoming_webhook(ENV['guild_wars_hook'])
  r = hook.send(text: message)
  status 200
  body ''
end
