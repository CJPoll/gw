require 'sinatra'

post '/guild_wars' do
  message = '@channel: Come play guild wars with me!'
  console.log(ENV['guild_wars_hook'])
  slack = Slackoff::Slack.new
  hook = slack.incoming_webhook(ENV['guild_wars_hook'])
  r = hook.send(text: message)
  puts r.body
  status r.status
  body ''
end
