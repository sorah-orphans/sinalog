require 'rubygems'
require 'sinatra'
require 'active_record'
###############################

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :dbfile => 'data/data.sqlite'
)

class Log < ActiveRecord::Base
end

