require 'sinatra'

get '/guild-wars' do
  message = '@channel: Come play guild wars with me!'
  slack = Slackoff::Slack.new
  hook = slack.incoming_webhook(ENV['guild_wars_hook'])
  hook.send(text: message)
  status 200
  body ''
end
