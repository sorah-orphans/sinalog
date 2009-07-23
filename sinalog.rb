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
