require 'rubygems'
require 'sinatra'
require 'haml'
require 'models/message'

set :haml, { :format => :html5, :attr_wrapper => '"' }

SITE_TITLE = 'IsItTheWeekendYet?'
SITE_TAGLINE = 'the question on everyone\'s mind'

get '/' do
  m = Message.new
  @title = "#{SITE_TITLE} - #{SITE_TAGLINE}"
  @answer, @comment, @countdown = m.answer, m.comment, m.countdown
  haml :index
end

get '/application.css' do
  content_type :css
  sass :style
end

get '/counts.json' do
  content_type :json
  Message.new.to_json
end

post '/timezone' do
  # TODO set the timezone cookie
  # this should be done in JS if available
  redirect '/'
end

not_found do
  'That URL doesn\'t exists.'
end
