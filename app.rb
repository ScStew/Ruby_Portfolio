require 'sinatra'

enable :sessions

not_found do
    redirect "/"
end

error do 
    "ERROR OCCURRED: #{env['sinatra.error'].message}"
end

get '/' do
    erb :landing, locals:{}
end

get '/about' do
    erb :about, locals:{}
end

get '/contact' do
    erb :contact, locals:{}
end

get '/projects' do
    erb :projects, locals:{}
end

