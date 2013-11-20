# After you add this file don't forget to restart the server.
require 'active_record'
require Rails.root.to_s +  "/lib/simple_search/simple_search"
ActiveRecord::Base.send(:extend, SearchPlugin::SimpleSearch)