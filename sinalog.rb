require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
###############################

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :dbfile => 'data/data.sqlite'
)

class Log < ActiveRecord::Base
end
class Comment < ActiveRecord::Base
end

###############################

get '/' do
    haml :index, :locals => {:logs => Log.find(:all)}
end
get '/log/:id' do |n|
    begin
        log = Log.find(n)
    rescue
        "Not Found"
    else
      haml :log, :locals => {:log => Log.find(n)}
    end
end

get '/edit/?' do
    haml :edit, :locals => {:entryid => nil}
end
get '/edit/:id' do |n|
    begin
        log = Log.find(n)
    rescue
        "Not Found"
    else
        haml :edit, :locals => {:entryid => n,:entry => log}
    end
end

post '/edit' do
    if !params[:id]
        log = Log.create(:title => params[:title],:body => params[:body].gsub("\n","<br/>"))
        redirect "/log/#{log.id}"
    else
        begin
            Log.update(params[:id],:title => params[:title],:body => params[:body].gsub("\n","<br/>"))
            redirect "/log/#{params[:id]}"
        rescue
            "Not Found"
        end
    end
end
    
