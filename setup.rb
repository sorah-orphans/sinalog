require 'rubygems'
require 'active_record'
##########################
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :dbfile => 'data/data.sqlite',
    :encoding => 'utf8'
)

class InitialSchema < ActiveRecord::Migration
    def self.up
        create_table :logs do |t|
            t.column :title,:string,:null => false
            t.column :body,:text,:null => false
            t.column :created_at,:datetime
            t.column :updated_at,:datetime
        end

        create_table :comments do |t|
            t.column :log_id,:integer,:null => false
            t.column :name,:string,:null => false
            t.column :body,:string,:null => false
            t.column :created_at, :datetime
        end
    end
    def self.down
        drop_table :logs
        drop_table :comments
    end
end

InitialSchema.migrate(:up)
